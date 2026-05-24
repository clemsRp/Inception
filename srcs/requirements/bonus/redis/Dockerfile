
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# Configuration to allow access from the Docker network
RUN sed -i "s|bind 127.0.0.1|bind 0.0.0.0|g" /etc/redis/redis.conf && \
    sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf

EXPOSE 6379

# Launch to the foreground to prevent the container from stopping
CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize no"]
