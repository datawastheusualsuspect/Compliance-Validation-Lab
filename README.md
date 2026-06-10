# DoD Cybersecurity Compliance Validation Lab

This repository contains the DoD Cybersecurity Compliance Validation Lab, a Docker-based simulation of a Blue Stripe Tech DoD IT security environment.

## Contents

- `DoD_Compliance_Report.txt` — compliance report with RMF, ATO, NIST SP 800-53, continuous monitoring, and security categorization coverage.
- `docker_lab/` — Docker lab implementation with services, monitoring, and sample ATO artifacts.
- `instructions.md` — original assignment or project instructions.

## Docker lab overview

The lab includes:

- Active Directory / Samba AD domain simulation
- DNS via `dnsmasq`
- Two web servers in a DMZ
- Nginx secure gateway proxy
- MailHog SMTP capture
- ELK logging stack with Filebeat
- Metricbeat host/container metrics
- Prometheus + Grafana monitoring stack
- cAdvisor container metrics

## Getting started

From the repository root:

```bash
cd docker_lab
./build_images.sh
docker compose up -d
```

Use these URLs after startup:

- Grafana: `http://localhost:3000` (default `admin/admin`)
- Prometheus: `http://localhost:9090`
- Kibana: `http://localhost:5601`
- MailHog: `http://localhost:8025`
- Secure gateway: `https://localhost:8443`

## Notes

- Linux is the best supported host environment.
- macOS works via Docker Desktop, and ARM compatiblity has been addressed for this stack.
- Windows should use WSL2/Linux backend to support the Linux-specific mounts used by monitoring services.

## Troubleshooting

```bash
docker compose logs -f
docker compose logs -f <service>
```

If a service fails at startup, check the bind mount paths and platform compatibility for any custom images.

## GitHub Codespaces

This repository includes a devcontainer configuration in `.devcontainer/` for Codespaces.

- Open the repo in GitHub Codespaces and the container will build automatically.
- The devcontainer installs Docker CLI and Compose so you can start the lab from within Codespaces.
- Launch directly using:

```text
https://github.com/codespaces/new?repo=datawastheusualsuspect/Compliance-Validation-Lab
```

- Then run:

```bash
cd docker_lab
docker compose up -d
```

Limitations:
- Codespaces does not always provide a full local Docker daemon. If Docker is unavailable, you may need to use a Codespaces machine with Docker support or run locally instead.
- Linux-style mounts like `/proc`, `/sys`, and `/var/run/docker.sock` work best in containers with Docker support enabled.
