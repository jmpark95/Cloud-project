resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
}

resource "google_firestore_database" "database" {
  name        = "(default)"
  provider    = google-beta
  location_id = var.region
  type        = "FIRESTORE_NATIVE"
  depends_on = [google_project_service.firestore]
}

resource "google_firestore_document" "viewCountDoc" {
  collection  = "viewCountCollection"
  document_id = "viewCountDocumentID"
  fields      = <<EOF
    {
      "count": {
        "integerValue": "0"
      }
    }
    EOF
  depends_on  = [google_firestore_database.database]
}
