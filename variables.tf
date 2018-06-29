variable "key_name" {}

variable "consul_cluster" {}

variable "organization" {}

variable "network_ws" {}

variable "servers" {
  default = 3
}

variable "env" {}

variable "vault_license" {}

variable "vault_version" {
  default = "0.10.3"
}

variable "install_type" {
  default = "oss"
}
