# Create storage bucket
resource "google_storage_bucket" "static-website" {
  name          = "static-website-minpark95"
  location      = "AUSTRALIA-SOUTHEAST1"
  storage_class = "STANDARD"
  website {
    main_page_suffix = "index.html"
  }

  uniform_bucket_level_access = true
  force_destroy               = true
}

# Add objects
resource "google_storage_bucket_object" "indexpage" {
  name         = "index.html"
  # source       = "${path.module}/src/index.html"
  content = filebase64("${path.module}/src/index.html")
  content_type = "text/html"
  bucket       = google_storage_bucket.static-website.id
}

resource "google_storage_bucket_object" "script" {
  name = "script.js"
  # source       = "${path.module}/src/script.js"
  content = filebase64("${path.module}/src/script.js")
  bucket  = google_storage_bucket.static-website.id
}

# Make publicly readable
resource "google_storage_bucket_iam_member" "member" {
  provider = google
  bucket   = google_storage_bucket.static-website.id
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}