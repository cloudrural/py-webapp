#!/bin/bash

DOCKER_BIN="/usr/bin/docker"
WEBAPP_PORT=$1
APP_NETWORK=$2

function deployapp(){
    echo "deploying the app"
    result=$(docker ps -q -f name=pyapp )
    if [[ $? -eq 0 ]]; then
    echo "Container exists"
    $DOCKER_BIN container rm -f pyapp
    echo "Deleted the existing docker container"
    else
    echo "No such container"
    fi

    $DOCKER_BIN run -d --name pyapp --net $APP_NETWORK pyapp:2020.1
    echo "App successfully deployed"

}
function deployweb(){
    echo "deploying the app"
    result=$(docker ps -q -f name=webapp )
    if [[ $? -eq 0 ]]; then
    echo "Container exists"
    $DOCKER_BIN container rm -f webapp
    echo "Deleted the existing docker container"
    else
    echo "No such container"
    fi

    $DOCKER_BIN run -d --name webapp --net $APP_NETWORK -p $WEBAPP_PORT:80 webapp:2020.1
    echo "Web server successfully deployed"

}
function runprocess(){
    $DOCKER_BIN ps -a  

}
deployapp
deployweb
runprocess
