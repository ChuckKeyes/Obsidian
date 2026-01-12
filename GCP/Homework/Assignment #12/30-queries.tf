# Query #1 -> writes to table query1_result
resource "google_bigquery_job" "query1" {
  job_id   = "query1-${random_id.suffix.hex}"
  location = var.bq_location

  depends_on = [google_bigquery_job.load_raw_all]

  query {
    query = <<-SQL
      -- Example Query 1 — edit this SQL
      SELECT *
      FROM `${var.project_id}.${google_bigquery_dataset.ds.dataset_id}.raw_all`
      WHERE TRUE
    SQL

    use_legacy_sql = false

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.ds.dataset_id
      table_id   = "query1_result"
    }
    write_disposition = "WRITE_TRUNCATE"
  }
}

# Query #2 -> writes to table query2_result
resource "google_bigquery_job" "query2" {
  job_id   = "query2-${random_id.suffix.hex}"
  location = var.bq_location

  depends_on = [google_bigquery_job.load_raw_all]

  query {
    query = <<-SQL
      -- Example Query 2 — edit this SQL
      SELECT COUNT(*) AS row_count
      FROM `${var.project_id}.${google_bigquery_dataset.ds.dataset_id}.raw_all`
    SQL

    use_legacy_sql = false

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.ds.dataset_id
      table_id   = "query2_result"
    }
    write_disposition = "WRITE_TRUNCATE"
  }
}

###############################################################
########  test QUERY   ########################################
#  SELECT a1, a2 * 10 WHERE a1 == "Buy" && a4.indexOf('oil') != -1 ORDER BY parseInt(a2), a4 LIMIT 100
#
###############################################################
