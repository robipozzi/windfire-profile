# This Terraform file creates the network security rules for the vpc.
# It configures ACLs and Security groups.

# ACL configuration for public subnet
resource "ibm_is_network_acl" "public_network_acl" {
    name = "${var.basename}-public_network_acl"
    rules {
        name = "http-allow-inbound"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
        tcp {
          port_max = 80
          port_min = 80
        }
    }
    rules {
        name = "https-allow-inbound"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
        tcp {
          port_max = 443
          port_min = 443
        }
    }
    rules {
        name = "all-allow-inbound-from_priv"
        action = "allow"
        source = "${var.private_subnet_1_ipv4_range}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
    }
    rules {
        name = "all-deny-inbound"
        action = "deny"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
    }
    rules {
        name = "http-allow-outbound"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "outbound"
        tcp {
          port_max = 80
          port_min = 80
        }
    }
    rules {
        name = "https-allow-outbound"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "outbound"
        tcp {
          port_max = 443
          port_min = 443
        }
    }
    rules {
        name = "all-allow-outbound-to_priv"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.private_subnet_1_ipv4_range}"
        direction = "outbound"
    }
    rules {
        name = "all-deny-outbound"
        action = "deny"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "outbound"
    }
}

# ACL configuration for private subnet
resource "ibm_is_network_acl" "private_network_acl" {
    name = "${var.basename}-private_network_acl"
    rules {
        name = "all-allow-inbound-from_pub"
        action = "allow"
        source = "${var.public_subnet_1_ipv4_range}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
        /*tcp {
          port_max = 9000
          port_min = 8000
        }*/
    }
    rules {
        name = "all-deny-inbound"
        action = "deny"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "inbound"
    }
    rules {
        name = "all-allow-outbound-to_pub"
        action = "allow"
        source = "${var.access_to_any_ip}"
        destination = "${var.public_subnet_1_ipv4_range}"
        direction = "outbound"
        /*tcp {
          port_max = 9000
          port_min = 8000
        }*/
    }
    rules {
        name = "all-deny-outbound"
        action = "deny"
        source = "${var.access_to_any_ip}"
        destination = "${var.access_to_any_ip}"
        direction = "outbound"
    }
}

resource ibm_is_security_group "sg1" {
    name = "${var.basename}-sg1"
    vpc = "${ibm_is_vpc.vpc.id}"
}

# allow all incoming network traffic on port 22
resource "ibm_is_security_group_rule" "ingress_ssh_all" {
    group = "${ibm_is_security_group.sg1.id}"
    direction = "inbound"
    remote = "0.0.0.0/0"                       
    tcp = {
        port_min = 22
        port_max = 22
    }
}