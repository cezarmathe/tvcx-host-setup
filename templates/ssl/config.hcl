# consul-template - config

consul {
  address = "${consul_address}"
  token   = "${consul_token}"

  retry {
    enabled     = true
    attempts    = 0
    backoff     = "250ms"
    max_backoff = "1m"
  }

  ssl {
    enabled = true
    verify  = true
  }
}

reload_signal = "SIGHUP"
kill_signal   = "SIGINT"

max_stale        = "10m"
block_query_wait = "60s"

log_level = "warn"

wait {
  min = "10s"
  max = "60s"
}

vault {
  address     = "${vault_address}"
  token       = "${vault_token}"
  renew_token = true

  retry {
    enabled     = true
    attempts    = 0
    backoff     = "250ms"
    max_backoff = "1m"
  }

  ssl {
    enabled = true
    verify  = true
  }
}

template {
  source      = "/etc/consul-template.d/${name}/ca.pem"
  destination = "${dest}/ca.pem"

  create_dest_dirs = true

  command         = "${cmd}"
  command_timeout = "${cmd_timeout}"

  error_on_missing_key = false

  perms = "640"

  backup = true

  wait {
    min = "2s"
    max = "10s"
  }
}

template {
  source      = "/etc/consul-template.d/${name}/cert.pem"
  destination = "${dest}/cert.pem"

  create_dest_dirs = true

  command         = "${cmd}"
  command_timeout = "${cmd_timeout}"

  error_on_missing_key = false

  perms = "640"

  backup = true

  wait {
    min = "2s"
    max = "10s"
  }
}

template {
  source      = "/etc/consul-template.d/${name}/cert-key.pem"
  destination = "${dest}/cert-key.pem"

  create_dest_dirs = true

  command         = "${cmd}"
  command_timeout = "${cmd_timeout}"

  error_on_missing_key = false

  perms = "600"

  backup = true

  wait {
    min = "2s"
    max = "10s"
  }
}
