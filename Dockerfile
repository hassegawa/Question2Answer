FROM php:7.2-apache

# Seta NonInteractive para TZDATA instalado pelo MTR
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Porcarias para adicionar o REPO da Microsoft sem erros.
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

EXPOSE 80

ENV MYSQL_HOST "127.0.0.1"
ENV	MYSQL_USERNAME "MYSQL_USERNAME"
ENV	MYSQL_PASSWORD "MYSQL_PASSWORD"
ENV	MYSQL_DB_NAME "MYSQL_DB_NAME"

RUN apt update && apt install -y curl unzip
RUN docker-php-ext-install mysqli pdo pdo_mysql

ARG VERSION=1.8.6

RUN cd /usr/src \
    && curl -LO https://github.com/q2a/question2answer/releases/download/v${VERSION}/question2answer-${VERSION}.zip \
    && unzip question2answer-${VERSION}.zip \
    && mv question2answer-${VERSION}/*  /var/www/html/ \
    && rm question2answer-${VERSION}.zip

RUN mkdir /usr/src/qa_blobs_directory    

WORKDIR /var/www/html/

COPY qa-config.php .
COPY .htaccess .
