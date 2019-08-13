#!/bin/sh

set -eo pipefail

readonly STANDARD_VERSION="v1"
readonly CNAME_ADDRESS="standards.lifeengine.io"
readonly WORKDIR="/src/${STANDARD_VERSION}"
readonly ONT_FILE="${WORKDIR}/Ontology/dli.jsonld"
readonly OUT_FOLDER="/tmp/html"
readonly ARTIFACTS_ROOT="/artifacts"
readonly ARTIFACTS="${ARTIFACTS_ROOT}/${STANDARD_VERSION}"
readonly THEME="darkly"

cd "${WORKDIR}"

mkdir "${OUT_FOLDER}"
mkdir "${ARTIFACTS}"

ontospy gendocs "${ONT_FILE}" -o "${OUT_FOLDER}" --title "PDigital Living" --theme="${THEME}" --type 2

# Copy the HTML to the artifacts folder.
cp -R "${OUT_FOLDER}"/* "${ARTIFACTS}"/

# Copy over the ontologies and contexts to GH pages
cp -R "${WORKDIR}/Context" "${ARTIFACTS}"/
cp -R "${WORKDIR}/Vocabulary" "${ARTIFACTS}"/
cp -R "${WORKDIR}/ClassDefinitions" "${ARTIFACTS}"/
echo "${CNAME_ADDRESS}" > "${ARTIFACTS_ROOT}"/CNAME