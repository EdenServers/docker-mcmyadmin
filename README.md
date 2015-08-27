# Official McMyAdmin Container on EdenServers

[![Run on EdenServers](https://img.shields.io/badge/EdenServers-view-blue.svg)](http://www.edenservers.us)
[![](https://badge.imagelayers.io/edenservers/mcmyadmin:latest.svg)](https://imagelayers.io/?images=edenservers/mcmyadmin:latest 'Get your own badge on imagelayers.io')

![](http://image.noelshack.com/fichiers/2015/35/1440685501-images.png)

All-in-one McMyAdmin Container built for [EdenServers](http://www.edenservers.us).

---

**This image is meant to be used on an EdenServers Server.**

Our images are built to specifically run for our services. You can run it directly with Docker though.

---
### 1.0.0 (2015-08-27)

This initial version contains:

* *mcmyadmin*

---

## Install

    $ docker pull edenservers/mcmyadmin

---

## Config


| Environment Variable  | Description |
| ------------- | ------------- |
| PASSWORD    | McMyAdmin Password |
| JAVA_MEMORY    | Minecraft Server RAM |

| Port  | Description |
| ------------- | ------------- |
| 8080 | Web interface  |
| 8123 | Dynmap  |
| 25565 | Minecraft Server  |

---

## Run example

    $  docker run -e PASSWORD=edenservers -e JAVA_MEMORY=2048 -p 8080:8080 -p 8123:8123 -p 25565:25565 --name mcmymadin -d edenservers/mcmyadmin

---

Made by [![EdenServers](http://image.noelshack.com/fichiers/2015/35/1440630894-logo.png)](https://www.edenservers.us)
