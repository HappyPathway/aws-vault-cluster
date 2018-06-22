variable "download_url" {
  default = "https://releases.hashicorp.com/vault/0.10.3/vault_0.10.3_linux_amd64.zip"
}

variable "consul_access" {
  default = "0.0.0.0/0"
}

variable "domain" {
  default = "this-demo.rocks"
}

variable "service_port" {
  default = 80
}

variable "set_dns" {
  default = true
}

variable "service_healthcheck_healthy_threshold" {
  default = 2
}

variable "service_healthcheck_unhealthy_threshold" {
  default = 3
}

variable "service_healthcheck_timeout" {
  default = 3
}

variable "service_healthcheck_interval" {
  default = 300
}

variable "cross_zone_load_balancing" {
  default = true
}

variable "connection_draining_timeout" {
  default = 400
}

variable "connection_draining" {
  default = true
}

variable "idle_timeout" {
  default = 400
}
