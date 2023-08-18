#!/bin/sh

set -eux

today=$(date +'%Y-%m-%d')

docker buildx build . \
  --platform linux/amd64,linux/arm64 \
  --push \
  --tag toyama4649/kirameki-php-cli:latest \
  --tag toyama4649/kirameki-php-cli:"${today}"
