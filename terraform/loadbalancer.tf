# Reserve load balancer's IP address.
resource "google_compute_global_address" "default" {
  name = "minpark-staticwebsite-ip"
}

# Create forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "http-lb-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "443"
  target                = google_compute_target_https_proxy.lb_default.id
  ip_address            = google_compute_global_address.default.id
}

# Configure LB backend buckets. Backend buckets allow you to use Google Cloud Storage buckets with HTTP(S) load balancing.
# An HTTP(S) load balancer can direct traffic to specified URLs to a backend bucket rather than a backend service. It
# can send requests for static content to a Cloud Storage bucket and requests for dynamic content to a virtual machine instance.
resource "google_compute_backend_bucket" "static-website" {
  name        = "static-website-files"
  description = "Static assets for the website"
  bucket_name = google_storage_bucket.static-website.name
  enable_cdn  = true
}


# Configure url map. UrlMaps are used to route requests to a backend service based on rules that you define for the host and path of an incoming URL.
resource "google_compute_url_map" "default" {
  name = "static-website-lb"

  default_service = google_compute_backend_bucket.static-website.id

  host_rule {
    hosts        = ["minpark.dev"]
    path_matcher = "main-page"
  }
  path_matcher {
    name            = "main-page"
    default_service = google_compute_backend_bucket.static-website.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.static-website.id
    }
  }
}

resource "google_dns_managed_zone" "my_zone" {
  name        = "minparkdev-zone"
  dns_name    = "minpark.dev."
}

resource "google_dns_record_set" "a_record" {
  name         = "minpark.dev."
  managed_zone = google_dns_managed_zone.my_zone.name
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_global_forwarding_rule.default.ip_address]
}

