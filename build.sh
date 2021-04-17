#!/bin/bash

DOCKER_BIN="/usr/bin/docker"
BASE_DIR=${PWD}
version=$1

function build_images(){
    echo " building the docker images of python app ..............."
    cd $BASE_DIR
    $DOCKER_BIN build -t pyapp:$version -f Dockerfile .
    cd $BASE_DIR/nginx
    $DOCKER_BIN build -t webapp:$version -f Dockerfile.nginx .
    echo "......................................................."
    echo "......................... images build successfully...."
    echo "......................................................."

}

function list_images(){
    echo "listing the docker images "
    $DOCKER_BIN images 
    echo " All images are listed"
}

build_images
list_images
