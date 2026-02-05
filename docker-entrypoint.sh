#!/bin/sh
set -e

# Clean default nginx files
rm -rf /usr/share/nginx/html/*

# Build the site
echo "Building site with BASE_URL=${BASE_URL:-http://localhost:8080}"
zola build --base-url "${BASE_URL:-http://localhost:8080}" --output-dir /usr/share/nginx/html --force

# Start Nginx
exec nginx -g "daemon off;"
