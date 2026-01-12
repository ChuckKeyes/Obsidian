variable "project_id"        { type = string }
variable "region"            {
     type = string  
     default = "us-central1" 
}
variable "gcs_location"      {
     type = string  
     default = "US" 
}
variable "bq_location"       {
     type = string  
     default = "US" 
}

# Optional: create an Ubuntu VM for testing (default: false)
variable "create_vm"         {
     type = bool    
     default = false 
}

# Optional: number of VMs if create_vm = true
variable "vm_count"          {
     type = number  
     default = 1 
}

variable "vpc_name"           {
     type    = string
     default = "hq-vpc"
  
}

# variable "project_id" {assignment-12-472020}
# variable "project_number" {}
# variable "dataset_id" {}
# variable "table_id" {}
# variable "results_dataset_id" {} # where to store DLP findings

