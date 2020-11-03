# host-setup

### Consul SSL

resource "local_file" "ct_consul_ssl" {
  sensitive_content = templatefile("${path.module}/templates/ssl/config.hcl", {
    consul_address       = var.consul_address
    consul_token         = var.consul_token
    vault_address        = var.vault_address
    vault_token          = var.vault_token
    name                 = "consul-ssl"
    dest                 = var.consul_ssl_dest
    cmd                  = var.consul_ssl_cmd
    cmd_timeout          = "10s"
  })

  filename             = "/etc/consul-template.d/consul-ssl/config.hcl"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_consul_ssl_ca" {
  content = file("${path.module}/templates/ssl/ca.pem")

  filename             = "/etc/consul-template.d/consul-ssl/ca.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_consul_ssl_cert" {
  content = file("${path.module}/templates/ssl/cert.pem")

  filename             = "/etc/consul-template.d/consul-ssl/cert.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_consul_ssl_cert_key" {
  content = file("${path.module}/templates/ssl/cert-key.pem")

  filename             = "/etc/consul-template.d/consul-ssl/cert-key.pem"
  file_permission      = "0600"
  directory_permission = "0750"
}

### Nomad SSL

resource "local_file" "ct_nomad_ssl" {
  sensitive_content = templatefile("${path.module}/templates/ssl/config.hcl", {
    consul_address       = var.consul_address
    consul_token         = var.consul_token
    vault_address        = var.vault_address
    vault_token          = var.vault_token
    name                 = "nomad-ssl"
    dest                 = var.nomad_ssl_dest
    cmd                  = var.nomad_ssl_cmd
    cmd_timeout          = "10s"
  })

  filename             = "/etc/consul-template.d/nomad-ssl/config.hcl"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_nomad_ssl_ca" {
  content = file("${path.module}/templates/ssl/ca.pem")

  filename             = "/etc/consul-template.d/nomad-ssl/ca.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_nomad_ssl_cert" {
  content = file("${path.module}/templates/ssl/cert.pem")

  filename             = "/etc/consul-template.d/nomad-ssl/cert.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_nomad_ssl_cert_key" {
  content = file("${path.module}/templates/ssl/cert-key.pem")

  filename             = "/etc/consul-template.d/nomad-ssl/cert-key.pem"
  file_permission      = "0600"
  directory_permission = "0750"
}

### Vault SSL

resource "local_file" "ct_vault_ssl" {
  sensitive_content = templatefile("${path.module}/templates/ssl/config.hcl", {
    consul_address       = var.consul_address
    consul_token         = var.consul_token
    vault_address        = var.vault_address
    vault_token          = var.vault_token
    name                 = "vault-ssl"
    dest                 = var.vault_ssl_dest
    cmd                  = var.vault_ssl_cmd
    cmd_timeout          = "10s"
  })

  filename             = "/etc/consul-template.d/vault-ssl/config.hcl"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_vault_ssl_ca" {
  content = file("${path.module}/templates/ssl/ca.pem")

  filename             = "/etc/consul-template.d/vault-ssl/ca.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_vault_ssl_cert" {
  content = file("${path.module}/templates/ssl/cert.pem")

  filename             = "/etc/consul-template.d/vault-ssl/cert.pem"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_vault_ssl_cert_key" {
  content = file("${path.module}/templates/ssl/cert-key.pem")

  filename             = "/etc/consul-template.d/vault-ssl/cert-key.pem"
  file_permission      = "0600"
  directory_permission = "0750"
}

### Nomad

resource "local_file" "ct_nomad_config" {
  sensitive_content = templatefile("${path.module}/templates/nomad-config/config.hcl", {
    consul_address       = var.consul_address
    consul_token         = var.consul_token
    vault_address        = var.vault_address
    vault_token          = var.vault_token
    dest                 = var.nomad_config_dest
    cmd                  = var.nomad_config_cmd
    cmd_timeout          = "10s"
  })

  filename             = "/etc/consul-template.d/nomad-config/config.hcl"
  file_permission      = "0640"
  directory_permission = "0750"
}

resource "local_file" "ct_nomad_config_json" {
  content = file("${path.module}/templates/nomad-config/nomad.json")

  filename             = "/etc/consul-template.d/nomad-config/nomad.json"
  file_permission      = "0640"
  directory_permission = "0750"
}
