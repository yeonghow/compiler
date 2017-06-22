FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip python-paramiko

RUN whoami

RUN useradd -G www-data ec2-user

RUN chown -R www-data:www-data /var/www/html/*
RUN chmod -R 774 /var/www/html/*
RUN ls -ld /var/www/html

USER www-data

VOLUME /var/www/html

RUN ls -ld /var/www/html

RUN chgrp -R www-data /var/www/html
RUN chmod -R g+w /var/www/html
RUN ls -ld /var/www/html
