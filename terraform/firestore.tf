resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
}

resource "google_firestore_database" "database" {
  name        = "(default)"
  location_id = var.region
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_document" "viewCountDoc" {
  collection  = "viewCountCollection"
  document_id = "viewCountDocumentID"
  fields      = "{\"count\":0}"
}