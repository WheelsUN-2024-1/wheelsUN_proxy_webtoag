FROM nginx:latest

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/server.cer /etc/nginx/ssl/server.cer
COPY config/server.key /etc/nginx/ssl/server.key

EXPOSE 81
