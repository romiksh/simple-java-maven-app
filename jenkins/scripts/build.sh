#!/bin/bash

echo "***********************"
echo "** Building Java App **"
echo "***********************"

docker run --rm -v $PWD:/app -w /app maven:3-alpine "$@"
#cp ./target/*.jar ./docker/
