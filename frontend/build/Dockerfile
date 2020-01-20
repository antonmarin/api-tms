FROM nginx:1.17.5-alpine as nginx_runtime
COPY build/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /app

FROM node:13.6 as builder
RUN npm install -g @angular/cli
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm install --production --no-save
COPY angular.json tsconfig.json tslint.json /app/
COPY projects /app/projects
RUN ng build --prod

FROM nginx_runtime
COPY --from=builder /app/http/ /app/http/
