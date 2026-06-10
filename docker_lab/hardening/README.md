Hardening and operational notes

Essentials to align the lab with the paper's protections:

1. Patching and configuration management
- Keep container images updated; rebuild and redeploy regularly.
- Store configuration in version control and use immutable images where possible.

2. Identity and access
- Integrate services with Samba AD for centralized authentication.
- Implement role-based access controls and limit administrative accounts.
- Enforce MFA for privileged accounts (use external MFA provider or AD MFA methods).

3. Endpoint protection
- Deploy EDR agents on endpoints (outside scope of container lab) or simulate with host-based IDS (e.g., OSSEC) in a container.

4. Logging and monitoring
- Install Filebeat on containers/hosts to forward logs to ELK (see sample filebeat config below).

Sample Filebeat snippet (adapt and enable with correct Elasticsearch host):

filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/nginx/*.log

output.elasticsearch:
  hosts: ["elk:9200"]

5. Network controls
- Use Docker networks as shown; enforce host-level firewall rules to restrict cross-network traffic.

6. ATO artifacts and POA&M
- Maintain System Security Plan (SSP) in the repository, collect evidence into an artifacts folder, and track open items in a POA&M document.

Limitations and next steps:
- Exchange, enterprise EDR, and hardware security modules require production appliances or licensed VMs and are not included here.
- For a realistic ATO rehearsal, produce an SSP, SAP, SAR and a sample POA&M aligned to the NIST mapping CSV.
