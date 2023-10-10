resource "google_cloud_run_v2_service" "default" {
  name     = "nodeservice"
  location = var.region

  template {
    scaling {
      min_instance_count = 1
    }
    containers {
      image = "gcr.io/static-website-project-400707/nodejsimage"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "default" {
  location = google_cloud_run_v2_service.default.location
  service  = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}