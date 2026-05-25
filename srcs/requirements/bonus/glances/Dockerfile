
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip lm-sensors && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir glances[web]

EXPOSE 61208

CMD ["glances", "-w"]
