#!/bin/sh

set -e

aws_region="$1"
aws_access_key_id="$2"
aws_secret_access_key="$3"


aws eks update-kubeconfig --name stg-strike-cluster --region $region


sh -c "cat ~/.kube/config"
