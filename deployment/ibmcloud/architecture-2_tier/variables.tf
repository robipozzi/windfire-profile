# This terraform file contains the variables and default values for this architecture. 
# Default values will be used unless changed at deployment time.

variable generation {
    description = "IBM Cloud Compute Generation"
    default = 1
}

variable basename {
    description = "Base name"
    default = "windfire-profile"
}

variable resource_group {
    default = "default"
}

# The actual public key that is available in IBM Cloud to be assigned to the virtual servers
variable ssh_key {
    description = "ssh public key"
    default = "rpozzi-ibmcloud"
}

# The IBM Cloud region to deploy architecture
variable ibm_region {
    description = "IBM Cloud Region code"
    default = "eu-de"
}

# Cloud availability zone 1 definitiion
variable availability_zone_1 {
    description = "IBM Cloud Region availability zone 1"
    default = "eu-de-1"
}

# Address space defined for Cloud availability zone 1
variable "availability_zone_1_address_prefix" {
    description = "Address prefix for IBM Cloud availability zone 1"
    default = "10.10.0.0/23"
}

# Cloud availability zone 2 definitiion
variable availability_zone_2 {
    description = "IBM Cloud Region availability zone 2"
    default = "eu-de-2"
}

# Address space defined for Cloud availability zone 2
variable "availability_zone_2_address_prefix" {
    description = "Address prefix for IBM Cloud availability zone 2"
    default = "10.10.2.0/23"
}

# IPv4 range assigned to public subnet within Cloud availabilty zone 1
variable "public_subnet_1_ipv4_range" {
    description = "IPv4 range for public subnet in IBM Cloud availability zone 1"
    default = "10.10.0.0/26"
}

# IPv4 range assigned to private subnet within Cloud availabilty zone 1
variable "private_subnet_1_ipv4_range" {
    description = "IPv4 range for private subnet in IBM Cloud availability zone 1"
    default = "10.10.0.64/26"
}

# Used by Security Group to give access to given resource.
variable access_to_any_ip {
  description = "Give access to any ip"
  default = "0.0.0.0/0"
}