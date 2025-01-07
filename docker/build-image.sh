#!/bin/sh

set -eux

today=$(date +'%Y-%m-%d')

docker login

# docker buildx create --name mybuilder --use
# docker buildx install

docker buildx build . \
  --platform linux/arm64,linux/amd64 \
  --push \
  --tag toyama4649/kirameki-php-cli:latest \
  --tag toyama4649/kirameki-php-cli:"${today}"
