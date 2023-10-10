resource "google_api_gateway_api" "api_cfg" {
  provider = google-beta
  api_id = "minpark-api-gateway"
}

# resource "google_api_gateway_api_config" "api_cfg" {
#   provider = google-beta
#   api = google_api_gateway_api.api_cfg.api_id
#   api_config_id = "min-config"

#   openapi_documents {
#     document {
#       path = "../openapi2-run.yaml"
#       contents = filebase64("../openapi2-run.yaml")
#     }
#   }
#   lifecycle {
#     create_before_destroy = false
#   }
# }

resource "google_api_gateway_gateway" "api_cfg" {
  provider = google-beta
  api_config = google_api_gateway_api_config.api_cfg.id
  gateway_id = "minparkgatewayid"
}