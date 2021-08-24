#!/bin/sh -eu

: "${AWS_ACCESS_KEY_ID?Must be specified}"
: "${AWS_SECRET_ACCESS_KEY?Must be specified}"
: "${AWS_DEFAULT_REGION?Must be specified}"

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 -d > /tmp/config

export KUBECONFIG=/tmp/config

sh -c "$*"
