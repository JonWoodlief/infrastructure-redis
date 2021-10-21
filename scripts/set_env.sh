#!/usr/bin/env bash

environment="${1:?"$(echo -e 'Missing the input environment!\n' && exit 1)"}"
region="${2:?"$(echo -e 'Missing the input region!\n' && exit 1)"}"
resource_group="${3:?"$(echo -e 'Missing the input resource_group!\n' && exit 1)"}"
name="${4}"

export TF_VAR_ibmcloud_api_key="${APIKEY}"
export TF_VAR_ibm_region="${region}"
export TF_VAR_resource_group_id="${resource_group}"
if [ ! -n "$name" ]; then
    // Use the template default naming (global catalog naming)
    export TF_VAR_db_name="${name}"
fi
export TF_VAR_environment="${environment}"

export TF_LOG=trace
export TF_LOG_PATH=./terraform.log


