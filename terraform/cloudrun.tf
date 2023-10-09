resource "google_cloudbuildv2_connection" "github_connection" {
  location = var.region
  name = "GCP-node-service-connection"

  github_config {
    app_installation_id = 42090683
    authorizer_credential {
      oauth_token_secret_version = var.github_access_token
    }
  }
}

resource "google_cloudbuildv2_repository" "node_repository" {
  name = "nodejs-service-repo"
  parent_connection = google_cloudbuildv2_connection.github_connection.name
  remote_uri = "https://github.com/jmpark95/Cloud-project-Nodejs-service.git"
}

resource "google_cloudbuild_trigger" "repo-trigger" {
  location = var.region

  repository_event_config {
    repository = google_cloudbuildv2_repository.node_repository.id
    push {
      branch = "feature-.*"
    }
  }

  filename = "Dockerfile"
}