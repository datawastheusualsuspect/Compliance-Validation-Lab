System Security Plan (SSP) — Blue Stripe Tech Lab (sample)

System Name: Blue Stripe Tech Docker Lab
Owner: Blue Stripe Tech
Scope: Demo lab emulating AD, DNS, web DMZ, secure gateway, mail capture, logging.

Implemented Controls (summary):
- Access Control (AC): Centralized accounts via Samba AD.
- Identification & Authentication (IA): AD authentication; MFA for privileged accounts (recommended).
- Audit & Accountability (AU): Centralized logs shipped to ELK via Filebeat.
- Configuration Management (CM): Docker images built from tracked Dockerfiles; patching guidance in hardening notes.

Evidence locations:
- `docker_lab/nist_mapping.csv`
- `docker_lab/hardening/README.md`
- Container build scripts and Dockerfiles in `docker_lab`
