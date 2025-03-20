FROM nginx:alpin




EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
