
FROM debian:bullseye

# Updating and installing PHP and the necessary tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget php php-mysqli && \
    rm -rf /var/lib/apt/lists/*

# Creating the folder for Adminer
WORKDIR /var/www/html

# Download the stable version of Adminer
RUN wget "https://www.adminer.org/latest.php" -O index.php

# Port exhibition
EXPOSE 8080

# Launch of the built-in PHP server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
