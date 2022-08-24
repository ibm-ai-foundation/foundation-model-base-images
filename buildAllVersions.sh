#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Todo: this should be refactored to run as a matrix of github actions env vars

${SCRIPT_DIR}/buildAndPush.sh '1.11.0-gpu' '1.11.0+cu115'
${SCRIPT_DIR}/buildAndPush.sh '1.13.0-gpu' '1.11.0+cu115'
${SCRIPT_DIR}/buildAndPush.sh '1.11.0-gpu' '1.12.0+cu116'
${SCRIPT_DIR}/buildAndPush.sh '1.13.0-gpu' '1.12.0+cu116'


