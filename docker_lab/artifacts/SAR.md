Security Assessment Report (SAR) — Blue Stripe Tech Lab (sample)

Assessment scope: Configuration and control implementation for lab services in `docker_lab`.

Summary of findings (sample):
- Filebeat configured to forward nginx and apache logs to ELK (elk:9200).
- Web servers run in DMZ network; nginx acts as perimeter proxy.
- No enterprise EDR installed in lab; recommend host-based IDS/EDR for endpoints.

Assessment evidence:
- Filebeat config: `docker_lab/filebeat/filebeat.yml`
- Dockerfiles and logs locations: `docker_lab/*`
