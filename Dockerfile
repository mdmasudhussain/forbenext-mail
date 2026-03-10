FROM php:8.2-cli

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y unzip \
 && unzip snappymail.zip \
 && rm snappymail.zip

# force snappymail to use repo data folder
ENV SNAPPYMAIL_DATA_DIR=/app/data

RUN mkdir -p /app/data \
 && chmod -R 777 /app/data

EXPOSE 10000

CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
