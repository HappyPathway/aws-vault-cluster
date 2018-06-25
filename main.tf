//--------------------------------------------------------------------
// Variables

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules
module "vault_cluster" {
  source            = "app.terraform.io/Darnold-Hashicorp/vault-cluster/aws"
  version           = "1.4.2"
  key_name          = "${var.key_name}"
  servers           = "${var.servers}"
  subnet            = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  resource_tags     = "${var.resource_tags}"
  consul_cluster    = "${data.aws_instance.consul_instance.cluster}"
  consul_cluster_sg = "${data.aws_instance.consul_instance.cluster_sg}"
  region            = "${data.terraform_remote_state.network.region}"
  service_name      = "vault-cluster"
  service_version   = "1.0.1"
  env               = "${var.env}"
}
