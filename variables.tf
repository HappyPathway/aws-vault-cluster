variable "vault_download_url" {
  default = "https://releases.hashicorp.com/vault/0.10.3/vault_0.10.3_linux_amd64.zip"
}

variable "consul_download_url" {}

variable "key_name" {}

variable "consul_cluster" {}

variable "organization" {}

variable "network_ws" {}

variable "servers" {
  default = 3
}
