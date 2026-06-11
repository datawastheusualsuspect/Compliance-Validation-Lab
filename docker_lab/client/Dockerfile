FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       sudo git curl vim less iproute2 iputils-ping ca-certificates gnupg lsb-release apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# Create a 'vscode' user for Codespaces/devcontainer access
RUN useradd -m -s /bin/bash vscode \
    && echo 'vscode ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

WORKDIR /home/vscode
USER vscode
