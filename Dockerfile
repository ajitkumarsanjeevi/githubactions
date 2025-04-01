# Use the official Ubuntu image as the base image
FROM ubuntu
RUN apt-get update && apt-get install nginx -y





EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
