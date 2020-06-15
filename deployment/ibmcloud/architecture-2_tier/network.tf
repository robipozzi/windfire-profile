# This Terraform file creates the network components for the vpc that will be used by the compute resources. 
# It configures the vpc and the subnets.

resource ibm_is_vpc "vpc" {
    name = "${var.basename}-vpc"
}

resource "ibm_is_vpc_address_prefix" "zone1_networking_prefix" {
    name = "${var.basename}-zone1_networking_prefix"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
    cidr = "${var.availability_zone_1_address_prefix}"
}

resource "ibm_is_vpc_address_prefix" "zone2_networking_prefix" {
    name = "${var.basename}-zone2_networking_prefix"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_2}"
    cidr = "${var.availability_zone_2_address_prefix}"
}

resource ibm_is_subnet "pub-subnet1" {
    name = "${var.basename}-pubsubnet1"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
    ipv4_cidr_block = "${var.public_subnet_1_ipv4_range}"
    public_gateway = "${ibm_is_public_gateway.public_gateway.id}"
    network_acl = "${ibm_is_network_acl.public_network_acl.id}"
}

resource ibm_is_subnet "priv-subnet1" {
    name = "${var.basename}-privsubnet1"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
    ipv4_cidr_block = "${var.private_subnet_1_ipv4_range}"
    network_acl = "${ibm_is_network_acl.private_network_acl.id}"
}

resource "ibm_is_public_gateway" "public_gateway" {
    name = "${var.basename}-public_gateway"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
}