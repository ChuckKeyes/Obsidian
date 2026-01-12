# output "vpc-id"        { value = module.hq-vpc.id }
# output "vpc-self-link" { value = module.hq-vpc.self-link }

# output "customer-service-vm-ip" { value = module.vm-customer-service.nat-ip }
# output "production-vm-ip"       { value = module.vm-production.nat-ip }
# output "finance-vm-ip"          { value = module.vm-finance.nat-ip }

output "bucket_name"   { value = google_storage_bucket.csv_bucket.name }
output "dataset_id"    { value = google_bigquery_dataset.ds.dataset_id }
output "tables"        { value = ["raw_all", "query1_result", "query2_result", "v_raw_preview (view)"] }
