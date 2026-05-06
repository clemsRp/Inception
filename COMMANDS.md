# Docker Commands

## Create and start container
```bash
docker run <options> <image name>
```
>options: `-it`, `--rm`

## Start container
```bash
docker start <container id>
```

## Interact with container
```bash
docker exec <container id> <command>  #  Interact inside the container

docker exec -it <container id> bash   #  Interact inside the container
```

## Stop container
```bash
docker stop <container id>
```

## List active containers
```bash
docker ps
# OR
docker container ps
```

## List all containers
```bash
docker ps -a
# OR
docker container ps -a
```

## List images
```bash
docker image ls
# OR
docker images
```

## Delete container
```bash
docker rm <container id>
# OR
docker container rm <container id>
```

## Delete image
```bash
docker rmi <image id>
# OR
docker image rm <image id>
```