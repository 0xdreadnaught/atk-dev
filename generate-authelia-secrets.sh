#!/bin/bash
# Generate JWT_SECRET
echo $(openssl rand -base64 32) > ./atk-auth/secrets/JWT_SECRET

# Generate SESSION_SECRET
echo $(openssl rand -base64 32) > ./atk-auth/secrets/SESSION_SECRET

