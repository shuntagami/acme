# syntax = docker/dockerfile:1.4

FROM ruby:3.1.3-slim
WORKDIR /app

RUN <<eot bash
  apt-get update
  apt-get install -y build-essential default-libmysqlclient-dev
  echo "Asia/Tokyo" > /etc/timezone
eot

COPY Gemfile* .

RUN <<eot bash
  gem install --no-ducument bundler
  bundle install
  rm -vf /usr/local/bundle/cache/*.gem
  find /usr/local/bundle/ -name "*.c" -delete
  find /usr/local/bundle/ -name "*.o" -delete
eot

COPY . .

CMD [ "bundle", "exec", "rackup", "-p", "4567", "--host", "0.0.0.0" ]
