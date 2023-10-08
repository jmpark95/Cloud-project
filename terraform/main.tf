terraform {
  backend "gcs" {
    credentials = var.credentials_file
    bucket  = "tf-state-prod"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = var.credentials_file
  project     = var.project
  region      = var.region
  zone        = var.zone
}