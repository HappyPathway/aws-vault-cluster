//--------------------------------------------------------------------
// Variables

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules
module "vault_cluster" {
  source            = "app.terraform.io/Darnold-Hashicorp/vault-cluster/aws"
  version           = "1.6.0"
  key_name          = "${var.key_name}"
  servers           = "${var.servers}"
  subnet            = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  resource_tags     = "${var.resource_tags}"
  consul_cluster    = "${data.terraform_remote_state.consul_cluster.cluster}"
  consul_cluster_sg = "${data.terraform_remote_state.consul_cluster.cluster_sg}"
  region            = "${data.terraform_remote_state.network.region}"
  env               = "${var.env}"
  vault_license     = "${var.vault_license}"
  service_version   = "${var.vault_version}"
  install_type      = "${var.install_type}"
}

# commenting for PR
