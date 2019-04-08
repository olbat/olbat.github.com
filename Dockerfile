FROM olbat/debian:buster
MAINTAINER devel@olbat.net

ARG NODE_VERSION=10

# dependencies for Jekyll (Ruby), uncss (NodeJS) and YUICompressor (Java)
RUN apt-get update \
&& apt-get install -y \
  ruby bundler gnupg zlib1g-dev libcurl4 \
  curl gnupg \
  openjdk-11-jre-headless \
  imagemagick libcairo2-dev libjpeg-dev \
&& curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -\
&& echo "deb http://deb.nodesource.com/node_${NODE_VERSION}.x buster main" \
  > /etc/apt/sources.list.d/nodejs.list \
&& apt-get update \
&& apt-get install -y git nodejs \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /src
WORKDIR /src
VOLUME /src

ENV NODE_PATH=/usr/lib/node_modules
RUN npm install -g --unsafe-perm=true uncss uglify-js fa-minify trianglify

COPY Gemfile Gemfile.lock /src/
RUN bundle install --system

CMD bundle exec jekyll build
