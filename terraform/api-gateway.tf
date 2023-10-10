resource "google_api_gateway_api" "api_cfg" {
  provider = google-beta
  api_id = "minpark-api-gateway"
}