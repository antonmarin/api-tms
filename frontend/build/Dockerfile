FROM nginx:1.17.5-alpine as nginx_runtime
COPY build/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /app

FROM nginx_runtime
COPY http/ /app/http/
