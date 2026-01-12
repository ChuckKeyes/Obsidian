resource "google_project_service" "dlp" {
  project = var.project_id
  service = "dlp.googleapis.com"
}
