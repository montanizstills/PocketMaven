#!/bin/sh -x

#clean up
# docker volume rm nexus-data
# docker container rm nexus-container
# docker image rm nexus-image

# Get lasest build
# https://help.sonatype.com/repomanager3/product-information/download/download-archives---repository-manager-3

#build
# docker build --rm -f nexus.dockerfile -t nexus-image .
docker build -f nexus.dockerfile -t nexus-image .

# offload nexus repository to github
# docker volume create nexus-data

#run
docker run -it --rm -p 8081:8081 --name nexus-container nexus-image
