FROM node:14.17.0 as build

WORKDIR /app

COPY . .

RUN npm ci --silent
RUN npm run build

FROM nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/build /usr/share/nginx/html
