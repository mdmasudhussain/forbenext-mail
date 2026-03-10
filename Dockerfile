FROM php:8.2-cli

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y unzip \
 && unzip snappymail.zip \
 && rm snappymail.zip \
 && chmod -R 777 data

EXPOSE 10000

CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
