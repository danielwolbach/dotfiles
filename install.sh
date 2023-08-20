#!/usr/bin/env bash

set -e

CONFIG_FILE="dotbot.yml"
DOTBOT_DIRECTORY="dotbot"

DOTBOT_BINARY="bin/dotbot"
BASE_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASE_DIRECTORY}"
git -C "${DOTBOT_DIRECTORY}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIRECTORY}"

"${BASE_DIRECTORY}/${DOTBOT_DIRECTORY}/${DOTBOT_BINARY}" -d "${BASE_DIRECTORY}" -c "${CONFIG_FILE}" "${@}"
