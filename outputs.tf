output "vault_address" {
  value = "${module.vault_cluster.vault_address}"
}

output "cluster_hash" {
  value = "${module.vault_cluster.cluster_hash}"
}

output "elb_security_group" {
  value = "${module.vault_cluster.elb_security_group}"
}

output "vault_elb" {
  value = "${module.vault_cluster.vault_elb}"
}

output "vault_security_group" {
  value = "${module.vault_cluster.vault_security_group}"
}
