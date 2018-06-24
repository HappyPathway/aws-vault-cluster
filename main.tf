//--------------------------------------------------------------------
// Variables

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules
module "vault_cluster" {
  source              = "app.terraform.io/Darnold-Hashicorp/vault-cluster/aws"
  version             = "1.2.1"
  key_name            = "${var.key_name}"
  servers             = "${var.servers}"
  subnet              = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id              = "${data.terraform_remote_state.network.vpc_id}"
  config              = "${data.template_file.vault_config.rendered}"
  vault_download_url  = "${var.vault_download_url}"
  consul_download_url = "${var.consul_download_url}"
  resource_tags       = "${var.resource_tags}"
  consul_cluster      = "${data.aws_instance.consul_instance.private_ip}"
  region              = "${data.terraform_remote_state.network.region}"
}
