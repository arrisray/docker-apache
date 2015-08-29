#!/bin/bash

DIR="/Users/arris/Code/sites" # $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
WEB_DIR="/var/www/html"

# Get ID of last run container
function dl() {
    docker ps -lq
}

# Start container based on specified image as a detached process
function dlstart() {
    local DOCKER_CMD=$1
    if [ -z $DOCKER_CMD ]; then
        DOCKER_CMD="arris/apache"
    fi

    docker run \
        -d \
        -p '80:80' \
        -v $DIR:$WEB_DIR \
        $DOCKER_CMD
}

# Stop the last run container
function dlstop() {
    docker stop $(dl)
    docker rm -v $(dl)
}

function dlshell() {
    docker exec -it $(dl) bash
}

