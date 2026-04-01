# infrastructure
My personal infrastructure as code and other automation files

# Nodes
| Name     | CPU                      | RAM   | Storage | Network (Up/Down) |
|----------|--------------------------|-------|---------|-------------------|
| Homelab  | Intel i5-6400 (4 Cores)  | 16GB  | ∞       | 300/100 Mbps      |
| HDZ VPS  | 4 vCPU                   | 6GB   | 100GB   | 10 Gbps           |

# Immediate TODO
- [ ] Restrict ansible user's sudo to certain commands
- [ ] Implement meta/argument_specs.yml for roles
- [ ] Change ansible playbook I've already written to the below services for the HDZ node.
- [ ] Implement Geo IP blocking into the Caddy reverse proxy.
- [ ] Configure backups to a cloud provider.
- [ ] Write a bash script that generates and/or pushes them into a HashiCorp Vault instance from/to a config file which will contain all the secrets needed to access HDZ node.

# Goals
## Backups
Minimum of [3-2-1 Backup](https://www.backblaze.com/blog/the-3-2-1-backup-strategy/) strategy.

HDZ Data Copies
1. Live production copy.
2. Homelab should pull backups from HDZ to store locally.
3. Push backups to a cloud storage provider.

Homelab Data Copies
1. Live production copy.
2. Homelab should push its own backups to a local disk.
3. Push only critical data to cloud storage provider to reduce costs.

## Automation
- Ansible playbooks should run on the Homelab node.
- Automated version upgrades using [Renovate](https://github.com/renovatebot/renovate).
- Backups should be automated through a bash script with a cron job utilizing [restic](https://restic.net).
- Restores do not need to be automated.

## Connectivity
Consider [NetBird](https://netbird.io/) or [Nebula](https://github.com/slackhq/nebula)
- Homelab needs a one way connection to HDZ.
- HDZ services need to be exposed directly.
- Homelab services should be gated behind VPN.

## HDZ Services
- [Caddy](https://caddyserver.com/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [Ente](https://ente.io)
    - Local Postgres, Remote S3 Backend

## HDZ Security
- SSH Key only authentication.
- Crowdsec bouncer for Caddy
- Block Geo IP from any other country than US.
- Consider writing an application that once authenticated will whitelist the IP for a duration to reduce attack surface.

## Observability
- Homelab should be responsible for all observability.
    - Prometheus for metrics, Grafana for visualizer, choose something for Log parser
- Consider [Wazuh](https://github.com/wazuh/wazuh)
