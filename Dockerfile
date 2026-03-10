FROM php:8.2-cli

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y unzip \
 && unzip snappymail.zip \
 && rm snappymail.zip

# recreate clean data folder every deploy
RUN rm -rf /app/data && mkdir /app/data && chmod -R 777 /app/data

EXPOSE 10000

CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
