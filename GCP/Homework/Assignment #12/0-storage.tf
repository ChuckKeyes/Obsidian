# Bucket (force_destroy so 'terraform destroy' removes objects too)
resource "google_storage_bucket" "csv_bucket" {
  name          = "bq-csv-${random_id.suffix.hex}"
  location      = var.gcs_location
  force_destroy = true

  depends_on = [google_project_service.services]
}

# Pick up all CSVs in ./data
locals {
  csv_files = fileset("${path.module}/data", "*.csv")
}

# Upload every CSV found in ./data
resource "google_storage_bucket_object" "csvs" {
  for_each = toset(local.csv_files)
  name     = each.value
  bucket   = google_storage_bucket.csv_bucket.name
  source   = "${path.module}/data/${each.value}"
}
