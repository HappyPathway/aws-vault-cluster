//--------------------------------------------------------------------
// Variables

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

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules
module "vault_cluster" {
  source        = "app.terraform.io/Darnold-Hashicorp/vault-cluster/aws"
  version       = "1.0.0"
  key_name      = "${var.key_name}"
  nodes         = "${var.vault_cluster_servers}"
  subnets       = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id        = "${data.terraform_remote_state.network.vpc_id}"
  config        = "${file("${path.root}/vault_config.json")}"
  download_url  = "${var.vault_download_url}"
  resource_tags = "${var.resource_tags}"
}
