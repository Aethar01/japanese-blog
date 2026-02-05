FROM nginx:alpine

# Install Zola from community repo (standard Alpine package)
# We update the index first to ensure we see the community packages
RUN apk update && apk add --no-cache zola

# Set working directory for the build
WORKDIR /app

# Copy ALL project files
COPY . .

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Setup the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["docker-entrypoint.sh"]

