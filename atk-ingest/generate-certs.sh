#!/bin/bash

# Function to check if the certificate is expired
check_cert_expiry() {
  cert_file=$1
  expiry_date=$(openssl x509 -enddate -noout -in $cert_file | cut -d= -f 2)
  expiry_date_seconds=$(date -d "$expiry_date" +%s)
  current_date_seconds=$(date +%s)

  if [ $current_date_seconds -ge $expiry_date_seconds ]; then
    return 1
  else
    return 0
  fi
}

# Check if certificates exist and are not expired
if [ ! -f /etc/nginx/ssl/wildcard_atk.crt ] || [ ! -f /etc/nginx/ssl/wildcard_atk.key ] || ! check_cert_expiry 
"/etc/nginx/ssl/wildcard_atk.crt"; then
  echo "Certificates not found or expired, generating self-signed wildcard certificates..."
  openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 \
    -keyout /etc/nginx/ssl/wildcard_atk.key \
    -out /etc/nginx/ssl/wildcard_atk.crt \
    -config /etc/nginx/ssl/openssl.cnf
fi
