DoD Cybersecurity Compliance Validation Lab

Overview:
- Minimal, local lab to emulate the example organization's services and apply security controls described in the report.
- Services: Samba AD (domain controller), DNS (dnsmasq), two Apache web servers (DMZ), Nginx secure gateway (perimeter), MailHog (SMTP capture), ELK (central logging), and a client container.
- Networks: `management`, `internal`, `dmz`, `perimeter` to mirror segmentation.

Quick start:

1. From `docker_lab` directory, run:

```bash
docker compose up -d
```

2. Access components:
- Nginx secure gateway: https://localhost:8443
- MailHog UI: http://localhost:8025
- ELK Kibana: http://localhost:5601

Notes on security controls and mapping to the paper:
- Network segmentation: services are placed on `dmz`, `internal`, and `management` networks to reflect least-exposure design.
- Authentication: Samba AD provides identity; configure services to use AD for accounts (manual steps documented in hardening notes).
- Continuous monitoring: ELK is included as central logging; enable Filebeat on services or configure logging mounts to forward logs into ELK.
- Configuration management & hardening: see `hardening/README.md` for recommended steps (patching, EDR/EDR agent placement, MFA guidance).

Limitations:
- This lab uses lightweight substitutes (MailHog for email capture, httpd for web). Production components such as Exchange or enterprise EDR require separate images and licensing.
- MFA, enterprise EDR, and full ATO artifacts require external tooling and manual documentation.

Supported host environments:
- Linux: best fit. All mounts and services are designed for a Linux host or Linux container runtime.
- macOS: supported via Docker Desktop; arm64 compatibility is handled for the current stack. Some host-level metric mounts are sensitive to the macOS Docker backend.
- Windows: supported best with WSL2/Linux backend. Native Windows Docker may fail on Linux-specific mounts like `/proc`, `/sys`, and `/var/run/docker.sock`.

Files of interest:
- `docker-compose.yml` — main composition and networks.
- `nginx/default.conf` — secure gateway proxy and logging configuration.
- `nist_mapping.csv` — example mapping between services and control families.
- `hardening/README.md` — steps to harden containers and host.
- `filebeat/filebeat.yml` — Filebeat configuration for forwarding logs to ELK.
- `metricbeat/metricbeat.yml` — Metricbeat configuration for host/container metrics.
- `prometheus/prometheus.yml` — Prometheus scrape configuration.
- `grafana/provisioning` — Grafana datasource and dashboard provisioning.
- `grafana/dashboards/docker-metrics.json` — Grafana dashboard for container metrics.
- `artifacts/SSP.md`, `artifacts/SAR.md`, `artifacts/POAM.md` — sample ATO artifacts.
- `build_images.sh` — script to build hardened local images.

Build and run (recommended order):

1. Build hardened images locally:

```bash
./build_images.sh
```

2. Start the stack:

```bash
docker compose up -d
```

3. After services start, import `kibana/dashboard.json` into Kibana via the UI and verify logs appear in Kibana.

Troubleshooting:
- Use `docker compose logs -f` to stream logs for all services.
- For a single service, use `docker compose logs -f <service>`.
- If services fail on startup, check bind mount paths and platform compatibility for any custom images.

Metrics and host/container monitoring:
- Metricbeat is included to collect Docker/container and host metrics and forward them to ELK. Metricbeat mounts the Docker socket and proc/cgroup to read container and system metrics.
- Prometheus and Grafana are included for container metrics dashboards. Prometheus scrapes cAdvisor, and Grafana provides a dashboard UI at http://localhost:3000.
- Grafana is provisioned with a Prometheus datasource and a default Docker metrics dashboard, `docker-metrics`.
- To enable metrics, ensure the stack is started with the mounts allowed (Docker Desktop/daemon permissions).
- Metricbeat config: `metricbeat/metricbeat.yml`.
- Prometheus config: `prometheus/prometheus.yml`.
- Grafana provisioning: `grafana/provisioning/`.

Accessing metrics:
- Use Kibana (http://localhost:5601) to create visualizations and dashboards based on Metricbeat indices (metricbeat-*).
- Use Grafana (http://localhost:3000; admin/admin) to view the Docker metrics dashboard.
