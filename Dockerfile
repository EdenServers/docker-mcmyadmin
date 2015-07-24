FROM				java:latest
MAINTAINER	EdenServers

EXPOSE			8080
EXPOSE			25565
EXPOSE      8123

ENV					PASSWORD edenservers
ENV					JAVA_MEMORY 2048
VOLUME      /home/mcmyadmin/

RUN					useradd mcmyadmin -m -s /bin/bash

RUN					rm -rf /var/lib/apt/lists/* && \
            apt-get clean && \
            apt-get update && \
						DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
						apt-get -y install vim wget

WORKDIR			/usr/local
RUN					wget http://mcmyadmin.com/Downloads/etc.zip && \
						unzip etc.zip && rm etc.zip

USER				mcmyadmin

ADD         McMyAdmin.conf /home/mcmyadmin/McMyAdmin.conf
ADD         start.sh /start.sh
RUN         RUN chmod 755 /start.sh

CMD         ["/start.sh"]
