#!/bin/sh

set -eo pipefail

readonly CNAME_ADDRESS="standards.lifeengine.io"
readonly WORKDIR="/src"
readonly ONT_FILE="/src/ontologies/dli.jsonld"
readonly OUT_FOLDER="/tmp/html"
readonly ARTIFACTS="/artifacts"
readonly THEME="darkly"

cd "${WORKDIR}"

mkdir "${OUT_FOLDER}"

# Need to choose type of export, 2 = Multi-site HTML.
echo 2 | ontodocs "${ONT_FILE}" -o "${OUT_FOLDER}" -t "Digital Living" --theme="${THEME}"

# Copy the HTML to the artifacts folder.
cp -R "${OUT_FOLDER}"/* "${ARTIFACTS}"/

# Copy over the ontologies to GH pages
cp -R "${WORKDIR}/ontologies" "${ARTIFACTS}"/

if [[ -d "${WORKDIR}/contexts" ]]; then
    cp -R "${WORKDIR}/contexts" "${ARTIFACTS}"/
fi

if [[ -d "${WORKDIR}/vocabularies" ]]; then
    cp -R "${WORKDIR}/vocabularies" "${ARTIFACTS}"/
fi

echo "${CNAME_ADDRESS}" > "${ARTIFACTS}"/CNAME