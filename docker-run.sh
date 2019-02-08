#!/bin/sh
readonly DOCKER=$(which docker)
readonly BUILD_NAME="doc-build"
readonly BUILD_SCRIPT="/src/docker-build.sh"

"${DOCKER}" run -v "${PWD}/artifacts:/artifacts" "${BUILD_NAME}" /bin/sh "${BUILD_SCRIPT}"