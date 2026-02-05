FROM ghcr.io/getzola/zola:v0.19.1 AS builder

WORKDIR /app
COPY . .
RUN ["zola", "build"]

FROM nginx:alpine
COPY --from=builder /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
