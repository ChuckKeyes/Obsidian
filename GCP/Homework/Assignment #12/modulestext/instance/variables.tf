variable "name"         { type = string }
variable "machine-type" { 
    type = string  
    default = "e2-micro" 
}
variable "zone"         { type = string }
variable "subnetwork"   { type = string } # self_link recommended
variable "tags"         { 
    type = list(string) 
    default = [] 
}
variable "image"        { 
    type = string 
    default = "debian-cloud/debian-11" 
}
