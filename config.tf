variable "resource_tags" {
  type = "map"

  default = {
    Owner       = "darnold"
    TTL         = 48
    ClusterName = "vault-demos"
  }
}

//--------------------------------------------------------------------
data "terraform_remote_state" "network" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.network_ws}"
  }
}

data "terraform_remote_state" "consul_cluster" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.consul_cluster}"
  }
}

data "aws_instance" "consul_instance" {
  instance_id = "${data.terraform_remote_state.consul_cluster.instances[0]}"
}

data "template_file" "vault_config" {
  template = "${file("vault_config.hcl.tpl")}"

  vars {
    consul_address = "${data.aws_instance.consul_instance.private_ip}"
  }
}
