FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    docker-cli \
    docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

# Install Docker Compose v2
RUN curl -fsSL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Add vscode user to docker group if needed
RUN groupadd -f docker && usermod -aG docker vscode
