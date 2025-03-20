# Use the official Ubuntu image as the base image
FROM ubuntu:latest


RUN apt update && apt install -y nginx


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
