# create a security group to limit communications on the public network 
# below are the policies for the group

resource "ibm_security_group" "sg1" {
    name = "${var.userids}-securitygroup"
    description = "allow my app traffic"
}

#create a rule to limit traffic to https on public network
resource "ibm_security_group_rule" "${var.userids}-allow_port_443" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 443
    port_range_max = 443
    protocol = "tcp"
    remote_ip = "0.0.0.0/8"
    security_group_id = "${ibm_security_group.sg1.id}"
}

# create a security group to limit communications on private network
# below are the policies for the group

resource "ibm_security_group" "sg2" {
    name = "${var.userids}-securitygroup"
    description = "allow my app traffic"
}
#create a rule to limit traffic to ssh on private network
resource "ibm_security_group_rule" "${var.userids}-allow_port_22" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    remote_ip = "0.0.0.0/8"
    security_group_id = "${ibm_security_group.sg2.id}"
}