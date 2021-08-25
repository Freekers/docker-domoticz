# stoorren/docker-domoticz

![Docker Image CI](https://github.com/svdtoorren/docker-domoticz/workflows/Docker%20Image%20CI/badge.svg)

This is a fork of linuxserver/docker-domoticz with personal customizations: include zigbee2mqtt plugin and Xiaomi robot plugin.

## Tags

The `latest` tag provides the latest stable version.

| Tag | Description |
| :----: | --- |
| latest | Latest stable version. |

## Usage

```
docker run -d \
  --name=domoticz \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e WEBROOT=domoticz `#optional` \
  -p 8080:8080 \
  -p 6144:6144 \
  -p 1443:1443 \
  -v <path to data>:/config \
  --device <path to device>:<path to device> \
  --restart unless-stopped \
  stoorren/docker-domoticz
```

## Docker-Compose

```
---
version: "2.1"
services:
  domoticz:
    image: stoorren/docker-domoticz
    container_name: domoticz
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - WEBROOT=domoticz #optional
    volumes:
      - <path to data>:/config
    ports:
      - 8080:8080
      - 6144:6144
      - 1443:1443
    devices:
      - <path to device>:<path to device>
    restart: unless-stopped  
```

### Further information

For further details refer to the Linuxserver manual: https://github.com/linuxserver/docker-domoticz
