#!/bin/sh
# Build a docker image containing node, npm, and vue cli
# Set the required gridsome cli version
VUE_CLI_VERSION='4.5.14'
GRIDSOME_CLI_VERSION='0.7.20'
docker build -t "crowdcode/gridsome-cli:${GRIDSOME_CLI_VERSION}" --build-arg VUE_CLI_VERSION=${VUE_CLI_VERSION} --build-arg GRIDSOME_CLI_VERSION=${GRIDSOME_CLI_VERSION} .
