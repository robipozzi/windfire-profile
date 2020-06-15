# This terraform file defines the terraform provider that will be used to deploy this architecture. 
# In this case, the IBM Cloud provider is the only provider that will be used. 
# The variables provide the means to deploy workloads. However, the APIkey and ibmid must have
# the permissions to deploy this archiecture's resources.

variable "ibmcloud_api_key" {}
variable "iaas_classic_username" {}
variable "iaas_classic_api_key" {}

provider "ibm" {
  ibmcloud_api_key      = "${var.ibmcloud_api_key}"
  generation            = "${var.generation}"
  region                = "${var.ibm_region}"
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.iaas_classic_api_key}"
}