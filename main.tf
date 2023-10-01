terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_storage_bucket" "static-website" {
  name          = "static-website-minpark95"
  location      = "AUSTRALIA-SOUTHEAST1"
  storage_class = "STANDARD"
  website {
    main_page_suffix = "index.html"
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "indexpage" {
  name         = "index.html"
  source       = "index.html"
  content_type = "text/html"
  bucket       = google_storage_bucket.static-website.id
}

resource "google_storage_bucket_iam_member" "member" {
  provider = google
  bucket   = google_storage_bucket.static-website.id
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}