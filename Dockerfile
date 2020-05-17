# simple gridsome-cli docker installation
# docker build -t gridsome-cli
# or specify gridsome-cli version
# build --build-arg GRIDSOME_CLI_VERSION= .

FROM node:lts-slim


LABEL maintainer="development@crowdcode.io" \
      description="Simple gridsome-cli docker container"

ARG VUE_CLI_VERSION=4.3.1
ARG GRIDSOME_CLI_VERSION=0.7.4
ENV GRIDSOME_CLI_VERSION=${GRIDSOME_CLI_VERSION}
ENV VUE_CLI_VERSION ${VUE_CLI_VERSION}
ARG USER_ID=1000
ARG USER_HOME_DIR="/build"
ARG WORKSPACE_DIR="/workspace"

ENV NPM_CONFIG_LOGLEVEL info
ENV HOME "$USER_HOME_DIR"

RUN apt-get update && apt-get install -qqy --no-install-recommends \
    ca-certificates \
    dumb-init \
    git \
    build-essential \
    python \
    procps \
    rsync \
    curl \
    zip \
    openssh-client \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN set -xe \
    && mkdir -p $USER_HOME_DIR \
    && chown $USER_ID $USER_HOME_DIR \
    && chmod a+rw $USER_HOME_DIR \
    && chown -R node /usr/local/lib /usr/local/include /usr/local/share /usr/local/bin \
    && (cd "$USER_HOME_DIR"; su node -c "npm install -g @vue/cli@${VUE_CLI_VERSION}; npm install -g yarn; chmod +x /usr/local/bin/yarn; npm cache clean --force") \
    && (cd "$USER_HOME_DIR"; su node -c "npm install -g @gridsome/cli;")


# not declared to avoid anonymous volume leak
# VOLUME "$USER_HOME_DIR/.cache/yarn"
# VOLUME "$APP_DIR/"
WORKDIR $WORKSPACE_DIR

EXPOSE 8080
 
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

USER ${USER_ID}