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
    #ca_cert = "/path/to/ca"
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
    #ca_cert = "/path/to/ca"
  }
}

template {
  source      = "/etc/consul-template.d/nomad-config/nomad.json"
  destination = "${dest}"

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
