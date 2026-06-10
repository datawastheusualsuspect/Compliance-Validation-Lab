FROM nginx:stable
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssl \
 && rm -rf /var/lib/apt/lists/*
COPY ./default.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/ssl/certs /etc/ssl/private
# In-lab self-signed certs (replace with CA-signed in production)
RUN openssl req -x509 -nodes -days 365 -subj "/CN=localhost" \
    -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key \
    -out /etc/ssl/certs/ssl-cert-snakeoil.pem
