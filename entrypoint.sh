#!/bin/sh

set -e

aws_region="$1"
aws_access_key_id="$2"
aws_secret_access_key="$3"
cluster_name="$4"
command="$5"

export aws_access_key_id="$aws_access_key_id"
export aws_secret_access_key="$aws_secret_access_key"

aws eks update-kubeconfig --name $cluster_name --region $aws_region

sh -c "$command"