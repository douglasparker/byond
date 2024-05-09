# BYOND

[![Version](https://img.shields.io/docker/v/neurekadev/byond?style=flat-square&sort=semver)](https://hub.docker.com/r/neurekadev/byond)
[![Docker Pulls](https://img.shields.io/docker/pulls/neurekadev/byond?style=flat-square)](https://hub.docker.com/r/neurekadev/byond)
[![Image Size](https://img.shields.io/docker/image-size/neurekadev/byond?style=flat-square)](https://hub.docker.com/r/neurekadev/byond)
[![License](https://img.shields.io/github/license/neurekadev/byond?style=flat-square)](https://github.com/neurekadev/byond/blob/main/LICENSE.md)

A docker image for building and hosting games made in the BYOND Engine.

## Tags

### Latest

The latest stable version of BYOND.

### Version

A specific version of BYOND.

## DreamDaemon (Host)

Example usage to host your projects.

### Docker Run

```docker
docker run --detach \
  --name game \
  --volume /opt/game:/opt/game \
  --publish 1337:1337 \
  --restart unless-stopped \
  ghcr.io/neurekadev/byond:latest DreamDaemon /opt/game/game.dmb -ports 1337
```

### Docker Compose

#### docker-compose.yml

```docker
services:
  byond:
    image: ghcr.io/neurekadev/byond:latest
    container_name: "game"
    command: "DreamDaemon /opt/game/game.dmb -ports 1337"
    volumes:
      - /opt/game:/opt/game
    ports:
      - 1337:1337
    restart: unless-stopped
```

## DreamMaker (Build)

Example usage to build your projects.

### Docker Run

```docker
docker run --rm \
  --volume /opt/game:/opt/game \
  ghcr.io/neurekadev/byond:latest DreamMaker /opt/game/game.dme
```
