FROM nginx:latest
COPY src/ /usr/share/nginx/html/
EXPOSE 8060
CMD [ "nginx","-g","daemon off"]
