# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy the contents of the current directory into the /usr/share/nginx/html directory of the container
COPY . /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80
