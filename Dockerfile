FROM ruby:3-slim

WORKDIR /srv/jekyll
COPY src/Gemfile .
EXPOSE 4000

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && ls \
    && apt-get -y install build-essential \
    && bundle install \
    && apt-get -y clean \
    && apt-get -y purge build-essential \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

