# Use the official Ubuntu image as the base image
FROM nginx:latest





EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
