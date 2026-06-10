FROM httpd:2.4
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*
COPY ./www/ /usr/local/apache2/htdocs/
