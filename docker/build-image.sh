#!/bin/sh

set -eux

today=$(date +'%Y-%m-%d')

docker build . \
  --push \
  --tag toyama4649/kirameki-php-cli:latest \
  --tag toyama4649/kirameki-php-cli:"${today}"
