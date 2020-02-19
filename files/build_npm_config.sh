#!/bin/bash
docker pull mergermarket/npm_repository_config:latest

docker run -it --rm \
        -e AWS_ACCESS_KEY_ID \
        -e AWS_SECRET_ACCESS_KEY \
        -e AWS_SESSION_TOKEN \
        -e AWS_DEFAULT_REGION \
        -v ~/:/home \
        mergermarket/npm_repository_config python build_npmrc.py "platform/$JENKINS_ENV/jenkins_npm_repository_config"