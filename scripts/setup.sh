#! /usr/bin/env bash

set -euC
set -o pipefail

addons=(
  "dashboard"
  "hostpath-storage"
)

# Install addons
for addon in "${addons[@]}"; do
  microk8s enable "$addon"
  sleep 15
done
