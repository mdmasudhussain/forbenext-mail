FROM php:8.2-cli

WORKDIR /app

COPY snappymail.zip /app/

RUN apt-get update && apt-get install -y unzip \
    && unzip snappymail.zip \
    && rm snappymail.zip

EXPOSE 10000

CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
