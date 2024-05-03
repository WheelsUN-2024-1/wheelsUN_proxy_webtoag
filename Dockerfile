FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

RUN echo ' \
    events {} \
    http { \
        server { \
            listen 9000; \
            location / { \
                allow 127.0.0.1; \
                deny all; \
                proxy_pass http://localhost:8100/; \
                proxy_set_header Host $host; \
                proxy_set_header X-Real-IP $remote_addr; \
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; \
                proxy_set_header X-Forwarded-Proto $scheme; \
            } \
        } \
    } \
' > /etc/nginx/nginx.conf

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]
