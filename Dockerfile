FROM ubuntu:18.04

ENV LANG de_DE.UTF-8
ENV LC_ALL de_DE.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get -y upgrade && apt-get install -y locales
RUN locale-gen de_DE.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl wget ssh php7.4-fpm php7.4-imap php7.4-mbstring php7.4-xsl php7.4-zip php7.4-mysql php7.4-opcache php7.4-curl php7.4-soap php7.4-bcmath php7.4-gd php-apcu

RUN update-rc.d -f php7.4-fpm remove
RUN mkdir -p /run/php

COPY ./php.ini /etc/php/7.4/fpm/php.ini