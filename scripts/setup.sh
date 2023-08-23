#! /usr/bin/env bash

set -euC
set -o pipefail

addons=(
    "dashboard"
    "ingress"
    "hostpath-storage"
    # Community addons
    "community"
)

# Install addons
for addon in "${addons[@]}"; do
    microk8s enable "$addon"
    sleep 15
done

# Install dashboard-ingress
microk8s enable dashboard-ingress --hostname dashboard.k8s.local
