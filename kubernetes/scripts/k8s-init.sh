#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
K8S_DIR="$(dirname "$SCRIPT_DIR")"

echo "Creating ConfigMap..."

kubectl create configmap smartcar-config \
    --from-env-file="$K8S_DIR/config/config.env" \
    --dry-run=client -o yaml | kubectl apply -f -

kubectl create configmap smartcar-mosquitto-config \
    --from-file="$K8S_DIR/config/mosquitto.conf" \
    --dry-run=client -o yaml | kubectl apply -f -

echo "Creating Secret..."

kubectl create secret generic smartcar-secret \
    --from-env-file="$K8S_DIR/config/secret.env" \
    --dry-run=client -o yaml | kubectl apply -f -

echo "Apply yamls files"

kubectl apply -R -f "$K8S_DIR"

echo "Done."