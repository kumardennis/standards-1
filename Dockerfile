FROM frolvlad/alpine-python3

ADD . /src
WORKDIR /src

RUN apk add --update --no-cache --virtual build-dependencies \
    python3-dev \
    build-base \
    linux-headers \
 && chmod +x docker-*.sh \
 && mkdir /artifacts \
 && ./docker-setup.sh \
 && apk del build-dependencies
