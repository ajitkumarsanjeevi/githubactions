FROM nginx:alpine

# Copy custom configuration file into the container (optional)
# COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy static content into the container (e.g., HTML, CSS, JS files)
COPY ./html /usr/share/nginx/html

# Expose port 80 to access the Nginx server from outside the container
EXPOSE 80

# The default command to run Nginx in the container
CMD ["nginx", "-g", "daemon off;"]
