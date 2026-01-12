# Dataset (delete contents on destroy)
resource "google_bigquery_dataset" "ds" {
  dataset_id                 = "demo_ds"
  location                   = var.bq_location
  delete_contents_on_destroy = true

  depends_on = [google_project_service.services]
}

# Load job: all CSVs uploaded above -> raw_all table
resource "google_bigquery_job" "load_raw_all" {
  job_id   = "load-raw-all-${random_id.suffix.hex}"
  location = var.bq_location

  # Wait until uploads are done
  depends_on = [google_storage_bucket_object.csvs]

  load {
    # Use wildcard so you can add/remove CSVs without changing Terraform
    source_uris = ["gs://${google_storage_bucket.csv_bucket.name}/*.csv"]

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.ds.dataset_id
      table_id   = "raw_all"
    }

    source_format         = "CSV"
    autodetect            = true
    skip_leading_rows     = 1      # set to 0 if your CSVs have no header
    write_disposition     = "WRITE_TRUNCATE"
    allow_quoted_newlines = true
  }
}

# Handy view to peek at data
resource "google_bigquery_table" "v_raw_preview" {
  dataset_id = google_bigquery_dataset.ds.dataset_id
  table_id   = "v_raw_preview"

  view {
    query          = "SELECT * FROM `${var.project_id}.${google_bigquery_dataset.ds.dataset_id}.raw_all` LIMIT 100"
    use_legacy_sql = false
  }

  deletion_protection = false
}
