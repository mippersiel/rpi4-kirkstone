#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker build --build-arg USER_NAME="${USER}" --build-arg USER_ID="$(id -u)" --build-arg GROUP_ID="$(id -g)" -t yocto-kirkstone "${SCRIPT_DIR}"
