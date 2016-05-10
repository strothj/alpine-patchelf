#!/bin/sh -e
PATCHELF_VER=0.9
IMAGE_TAG="alpine-patchelf-build"

docker build -t $IMAGE_TAG .
ID=$(docker create $IMAGE_TAG)
mkdir -p ./build
docker cp $ID:/build/${PATCHELF_VER}.tar.gz ./build
docker rm -v $ID
docker rmi $IMAGE_TAG