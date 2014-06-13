# sendgridjp-webhook-docker
#
# VERSION	1.0
#
# use the ubuntu base image provided by dotCloud
#
FROM dockerfile/ubuntu
MAINTAINER awwa, awwa500@gmail.com

#
# make sure the package repository is up to date
#
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

#
# install ssh for maintainance
#
RUN apt-get install -y openssh-client
RUN apt-get install -y ssh-import-id openssh-server
RUN mkdir -p /var/run/sshd
RUN echo root:password | chpasswd
RUN echo 'rootpass ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN sed -e "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config > /etc/ssh/sshd_config
#
# expose ssh port
#
EXPOSE 22
EXPOSE 7076

#
# install modules

#
# for Japanese
#
RUN apt-get install -y language-pack-ja
RUN echo ":set encoding=utf-8" >> /root/.vimrc
RUN echo ":set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8" >> /root/.vimrc
RUN echo "export LESSCHARSET=utf-8" >> /root/.profile

#
# for general
#
RUN apt-get install -y perl
RUN apt-get install -y libswitch-perl
RUN apt-get install -y perl-modules
RUN apt-get install -y liberror-perl
RUN apt-get install -y git

#
# for PHP
#
RUN apt-get install -y php5 curl libcurl3 php5-curl
WORKDIR /usr/local/bin
RUN curl -sS https://getcomposer.org/installer | php
#
# Get sample code
RUN mkdir /root/php
WORKDIR /root/php
RUN git clone https://github.com/sendgridjp/sendgridjp-php-example
WORKDIR /root/php/sendgridjp-php-example
RUN /usr/local/bin/composer.phar install
ADD ./.env /root/php/sendgridjp-php-example/.env

#
# for node.js
RUN apt-get install -y g++ build-essential
RUN mkdir /root/nodejs
WORKDIR /root/nodejs
RUN wget http://nodejs.org/dist/v0.11.13/node-v0.11.13.tar.gz
RUN tar zxvf node-v0.11.13.tar.gz
WORKDIR /root/nodejs/node-v0.11.13
RUN ./configure
RUN make install
#
# Get sample code
WORKDIR /root/nodejs
RUN git clone https://github.com/SendGridJP/sendgrid-parse-demo.git
WORKDIR /root/nodejs/sendgrid-parse-demo
RUN npm install
ADD ./.env /root/nodejs/sendgrid-parse-demo/.env

