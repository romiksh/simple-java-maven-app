#!/bin/bash

echo "***********************"
echo "** Building Java App **"
echo "***********************"

docker run --rm -v /root/jenkins_home/workspace/testpipe:/app -w /app maven:3-alpine "$@"
#cp ./target/*.jar ./docker/
