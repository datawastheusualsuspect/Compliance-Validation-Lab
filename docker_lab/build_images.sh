#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "Building web1 image..."
docker build -t bluestripe/web:latest ./web1

echo "Building web2 image..."
docker build -t bluestripe/web:latest ./web2

echo "Building nginx secure-gw image..."
docker build -t bluestripe/nginx:latest ./nginx

echo "Done. You can now run: docker compose up -d"
