#!/bin/sh

set -e

aws_region="$1"
aws_access_key_id="$2"
aws_secret_access_key="$3"

export aws_access_key_id="$aws_access_key_id"
export aws_secret_access_key="$aws_secret_access_key"


aws eks update-kubeconfig --name stg-strike-cluster --region $aws_region


sh -c "cat ~/.kube/config"
