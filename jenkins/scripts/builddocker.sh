#!/bin/bash

echo "***************************"
echo "** Building Docker Image **"
echo "***************************"


cd docker && docker-compose -f docker-compose-java.yml build
