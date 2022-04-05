FROM php:7.2-apache

# Seta NonInteractive para TZDATA instalado pelo MTR
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Porcarias para adicionar o REPO da Microsoft sem erros.
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

EXPOSE 80

ENV MYSQL_HOST "127.0.0.1"
ENV	MYSQL_USERNAME "question-user"
ENV	MYSQL_PASSWORD "QuestionAnswer42"
ENV	MYSQL_DB_NAME "question-db"

RUN apt update && apt install -y curl unzip
RUN docker-php-ext-install mysqli pdo pdo_mysql

ARG VERSION

RUN cd /usr/src \
    && curl -LO https://github.com/q2a/question2answer/releases/download/v${VERSION}/question2answer-${VERSION}.zip \
    && unzip question2answer-${VERSION}.zip \
    && mv question2answer-${VERSION}/*  /var/www/html/ \
    && rm question2answer-${VERSION}.zip

RUN mkdir /usr/src/qa_blobs_directory    

WORKDIR /var/www/html/

COPY qa-config.php .
COPY .htaccess .
