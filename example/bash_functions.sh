#!/usr/bin/env bash

simple-http-server() {
    docker stop http-server
    docker run --rm \
            --name http-server \
            -v $(pwd):/serve \
            -P \
            -d \
            jdkelley/simple-http-server:latest
    echo -ne "\nBrowse to http://localhost:"
    docker port http-server | cut -d':' -f'2'
    docker logs -f http-server
}
