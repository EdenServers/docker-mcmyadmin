FROM				java:latest
MAINTAINER	EdenServers

EXPOSE			8080
EXPOSE			25565

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

WORKDIR			/home/mcmyadmin
RUN					wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
						unzip MCMA2_glibc26_2.zip && rm MCMA2_glibc26_2.zip && \
						chown -R mcmyadmin:mcmyadmin /home/mcmyadmin

USER				mcmyadmin

RUN					/home/mcmyadmin/MCMA2_Linux_x86_64 -nonotice -updateonly

ENTRYPOINT	/home/mcmyadmin/MCMA2_Linux_x86_64 -setpass "$PASSWORD" +java.memory $JAVA_MEMORY
