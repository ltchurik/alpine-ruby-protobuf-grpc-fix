
FROM ruby:2.7.2-alpine

RUN apk update && apk add --no-cache \
    build-base \
    curl \
    curl-dev \
    vim \
    git \
    postgresql-dev \
    nodejs \
    nginx \
    nginx-mod-http-headers-more \
    dcron \
    bash \
    tzdata \
    openssl \
    imagemagick \
    icu-dev \
    docker \
    gcompat

# install bundler version
RUN gem install bundler:2.1.4

RUN bundle config set --local force_ruby_platform true \
    && bundle config build.grpc --with-cflags=-D__va_copy=va_copy \
    && bundle config build.google-protobuf --with-cflags=-D__va_copy=va_copy
RUN bundle install --jobs $(nproc) --deployment --clean --path vendor/bundle --without development test
