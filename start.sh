#!/bin/bash

cd /home/mcmyadmin/ && \
    wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
		unzip MCMA2_glibc26_2.zip && rm MCMA2_glibc26_2.zip

/home/mcmyadmin/MCMA2_Linux_x86_64 -setpass "$PASSWORD" +java.memory $JAVA_MEMORY
