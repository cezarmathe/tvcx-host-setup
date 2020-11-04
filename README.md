# tvcx-host-setup

Repository that must be cloned on each host that will be part of the stack in order to create the
initial setup.

## Vault tokens

To generate Vault tokens for consul-template, use:

```bash
vault token create -orphan -policy=pki_issue_stack -renewable -ttl=24h
```
