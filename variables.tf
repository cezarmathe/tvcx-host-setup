# host-setup - variables

variable "consul_address" {
  type        = string
  description = "The Consul address that should be used by consul-template."
}

variable "consul_token" {
  type        = string
  description = "The Consul token that should be used by consul-template."
}

variable "consul_domain" {
  type        = string
  description = "The domain used by Consul for DNS queries."
  default     = "consul"
}

variable "ip_san" {
  type        = string
  description = "IP SAN to use for certificates."
}

variable "vault_address" {
  type        = string
  description = "The Vault address that should be used by consul-template."
}

variable "vault_token" {
  type        = string
  description = "The Vault address that should be used by consul-template."
}

variable "consul_ssl_dest" {
  type        = string
  description = "Where consul-template will install the SSL files for Consul."
}

variable "consul_ssl_cmd" {
  type        = string
  description = "The command consul-template should run when there are any changes in the rendered templates for consul ssl."
}

variable "nomad_ssl_dest" {
  type        = string
  description = "Where consul-template will install the SSL files for Nomad."
}

variable "nomad_ssl_cmd" {
  type        = string
  description = "The command consul-template should run when there are any changes in the rendered templates for nomad ssl."
}

variable "vault_ssl_dest" {
  type        = string
  description = "Where consul-template will install the SSL files for Vault."
}

variable "vault_ssl_cmd" {
  type        = string
  description = "The command consul-template should run when there are any changes in the rendered templates for vault ssl."
}

variable "nomad_config" {
  type        = string
  description = "The Nomad configuration to get from Consul KV."
}

variable "nomad_config_dest" {
  type        = string
  description = "The destination for a nomad config file."
}

variable "nomad_config_cmd" {
  type        = string
  description = "The command consul-template should run when there are any changes in the rendered templates for nomad config."
}
