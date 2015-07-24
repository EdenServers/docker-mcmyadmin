FROM				java:latest
MAINTAINER	EdenServers

EXPOSE			8080
EXPOSE			25565
EXPOSE      8123

ENV					PASSWORD edenservers
ENV					JAVA_MEMORY 2048

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
						unzip MCMA2_glibc26_2.zip && rm MCMA2_glibc26_2.zip

ADD         McMyAdmin.conf /home/mcmyadmin/McMyAdmin.conf
ADD         start.sh /start.sh
RUN         chmod 755 /start.sh

RUN					/home/mcmyadmin/MCMA2_Linux_x86_64 -nonotice -updateonly

CMD         ["/start.sh"]
