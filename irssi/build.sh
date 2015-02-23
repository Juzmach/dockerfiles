#!/bin/bash

image_name=$1
container_name=$2

docker build -t $image_name .
docker run -d -P --name $container_name $image_name
docker port $container_name 22
