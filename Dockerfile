# Use the official Ubuntu image as the base image
FROM nginx:latest


CMD ["nginx", "-g", "daemon off;"]
