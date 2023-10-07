#Create a Google-managed SSL certificate
resource "google_compute_managed_ssl_certificate" "lb_default" {
  name     = "terraform-ssl-cert"

  managed {
    domains = ["minpark.dev"]
  }
}

#Or you can use it to update an existing load balancer, as described here:
resource "google_compute_target_https_proxy" "lb_default" {
  name     = "terraform-practice-https-proxy"
  url_map  = google_compute_url_map.default.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.lb_default.name
  ]
  depends_on = [
    google_compute_managed_ssl_certificate.lb_default
  ]
}