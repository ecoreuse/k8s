#! /usr/bin/env bash

set -euC
set -o pipefail

addons=(
    "dns"
    "dashboard"
    "ingress"
    "metallb:192.168.1.100-192.168.1.200"
    "community"
    # Community addons
)

# Install addons
for addon in "${addons[@]}"; do
    microk8s enable "$addon"
    sleep 15
done

# Install dashboard-ingress
microk8s enable dashboard-ingress --hostname dashboard.k8s.local
