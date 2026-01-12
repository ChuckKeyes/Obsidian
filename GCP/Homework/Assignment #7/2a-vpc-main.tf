provider "google" {
  project = "terraform-aws-gcp-vpn"
  region  = "us-east1"
}

resource "google_storage_bucket" "bucket" {
  name     = "my-terraform-bucket"
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
  credentials = "key-061025.json"
}

