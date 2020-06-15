# This terraform file provisions the compute resources.

/*data ibm_is_image "ubuntu" {
    name = "ubuntu-18.04-amd64"
}

data ibm_is_ssh_key "ssh_key_id" {
    name = "${var.ssh_key}"
}

resource ibm_is_instance "frontend" {
    name = "${var.basename}-frontend"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
    keys = ["${data.ibm_is_ssh_key.ssh_key_id.id}"]
    image = "${data.ibm_is_image.ubuntu.id}"
    profile = "cc1-2x4"
    primary_network_interface = {
        subnet          = "${ibm_is_subnet.pub-subnet1.id}"
        security_groups = ["${ibm_is_security_group.sg1.id}"]
    }
}

resource ibm_is_floating_ip "fip1" {
    name = "${var.basename}-fip1"
    target = "${ibm_is_instance.frontend.primary_network_interface.0.id}"
}

resource ibm_is_instance "backend" {
    name = "${var.basename}-backend"
    vpc = "${ibm_is_vpc.vpc.id}"
    zone = "${var.availability_zone_1}"
    keys = ["${data.ibm_is_ssh_key.ssh_key_id.id}"]
    image = "${data.ibm_is_image.ubuntu.id}"
    profile = "cc1-2x4"
    primary_network_interface = {
        subnet          = "${ibm_is_subnet.priv-subnet1.id}"
        security_groups = ["${ibm_is_security_group.sg1.id}"]
    }
}

output sshcommand {
    value = "ssh root@${ibm_is_floating_ip.fip1.address}"
}*/