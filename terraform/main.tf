terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google" {
  credentials = var.gcp_credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

provider "google-beta" {
  credentials = var.gcp_credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}