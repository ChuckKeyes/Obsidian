locals {
  apis = [
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "networkconnectivity.googleapis.com",
    "dns.googleapis.com",
    "secretmanager.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "iap.googleapis.com",
    # optional:
    # "datamigration.googleapis.com",
    # "pubsub.googleapis.com",
    # "run.googleapis.com",
    # "vpcaccess.googleapis.com",
    # "cloudkms.googleapis.com",
    # "bigquery.googleapis.com",
    # "bigqueryconnection.googleapis.com",
  ]
}

resource "google_project_service" "enable" {
  for_each = toset(local.apis)
  project  = var.project_id
  service  = each.key
}
