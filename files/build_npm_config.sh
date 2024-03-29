#!/bin/bash
docker pull mergermarket/npm_repository_config:latest

TOKEN=$(curl -X PUT http://169.254.169.254/latest/api/token -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/dynamic/instance-identity/document > ~/env.json

docker run --rm \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_DEFAULT_REGION=eu-west-1 \
    -v ~/:/home \
    -u $(id -u):$(id -g) \
    mergermarket/npm_repository_config python build_npmrc.py /home/env.json

mv ~/.npmrc /home/jenkins/.npmrc
chown jenkins:jenkins /home/jenkins/.npmrc