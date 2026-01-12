variable "vpc-name"                { type = string }
variable "auto-create-subnetworks" { 
    type = bool    
    default = false 
}
variable "routing_mode"            {
     type = string  
     default = "REGIONAL" 
}
