FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip

RUN groupadd -r www-data \
  && useradd -r -g www-data www-data && \
  chown -R www-data:www-data /var/www/html && \
  chmod -R 775 /var/www/html && \
  ls -al /var/www/html

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/*
  
RUN cd /opt && wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-4.0.1-linux_x86_64-portable.tar.bz2 && \
    tar -xvf pypy-4.0.1-linux_x86_64-portable.tar.bz2 && \
    ln -s /opt/pypy-4.0.1-linux_x86_64-portable/bin/pypy /usr/local/bin && \
    ls /opt; \
    ls /opt/pypy-4.0.1-linux_x86_64-portable/bin; \
    pypy --version

USER www-data
