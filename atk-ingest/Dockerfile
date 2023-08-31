# Use the official Nginx image
FROM nginx:latest

# Copy local configuration files
COPY ./my-nginx.conf /etc/nginx/nginx.conf

# Copy the certificate generation script
COPY ./generate-certs.sh /etc/nginx/generate-certs.sh

# Make the script executable
RUN chmod +x /etc/nginx/generate-certs.sh

# Copy the cert settings
COPY ./openssl.cnf /etc/nginx/openssl.cnf

# Run the script on container startup
CMD ["/bin/sh", "-c", "/etc/nginx/generate-certs.sh && nginx -g 'daemon off;'"]

