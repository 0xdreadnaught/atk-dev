# Use the Nginx image as the base image
FROM nginx:latest

COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf

# Copy the dummy HTML file into the Nginx container
COPY ./html/index.html /usr/share/nginx/html/index.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]

