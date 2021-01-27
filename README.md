# alpine-ruby-protobuf-grpc-fix
This is fix for alpine linux protobuf+grpc segmentation fault

Basic steps:
* apk add --no-cache gcompat
* bundle config set --local force_ruby_platform true
* bundle config build.grpc --with-cflags=-D__va_copy=va_copy
* bundle config build.google-protobuf --with-cflags=-D__va_copy=va_copy
* bundle install --force (or bundle install)
