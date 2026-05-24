
FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/sites-available/default

COPY tools/ /var/www/static/

CMD ["nginx", "-g", "daemon off;"]
