#!/usr/bin/env bash

RAY_VERSION="1.11.0-gpu"
TORCH_VERSION="1.12.0+cu116"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REGISTRY='ghcr.io'
NAMESPACE='ibm-ai-foundation'
NAME='base'

cd "${SCRIPT_DIR}"

TIMESTAMP=$(date "+%Y%m%d-%H%M%S")

# note: docker tags must be valid ASCII and may contain lowercase and uppercase letters, digits, underscores, periods and dashes.
# A tag name may not start with a period or a dash and may contain a maximum of 128 characters
VERSION="$(echo ${1:-ray${RAY_VERSION}-pytorch${TORCH_VERSION}-$TIMESTAMP}| sed 's/[^[:alnum:]\.\_\-]//g')"
TAG="${REGISTRY}/${NAMESPACE}/${NAME}:${VERSION}"

docker build \
  --build-arg RAY_VERSION=${RAY_VERSION} \
  --build-arg TORCH_VERSION=${TORCH_VERSION} \
  -t ${TAG} \
  .

# REDSONJA_READ_WRITE key is configurable in https://travis.ibm.com/codeflare/base-images/settings

# This happens in the github action
#echo "${GH_REGISTRY_PUSH_TOKEN}" | docker login "${REGISTRY}/${NAMESPACE}" --username "${GH_REGISTRY_USER}" --password-stdin

docker push ${TAG}

