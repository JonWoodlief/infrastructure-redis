#!/usr/bin/env bash

set -x

environment="${1:?"$(echo -e 'Missing the input environment!: test | prod\n' && exit 1)"}"
region="${2:?"$(echo -e 'Missing the input region!: us-south | eu-de | ....\n' && exit 1)"}"
resource_group="${3:?"$(echo -e 'Missing the input resource_group id!\n' && exit 1)"}"

name="cm-cloudant-${region}-${environment}"

echo "intrastructure-cloudant: $name"
echo "   environment:    ${environment}"
echo "   region:         ${region}"
echo "   resource_group: ${resource_group}"

## convert env to TF_VAR values
. "./scripts/set_env.sh" "${environment}" "${region}" "${resource_group}"

check_if_exists="$(terraform workspace list | grep "${name}")"
if [[ -z "${check_if_exists}" ]]; then
  terraform workspace new "${name}"
else
  terraform workspace select "${name}"
fi

set -e 

ln -s ./ibm-provider/provider.tf ./provider.tf > /dev/null 2>&1 || true

terraform init -upgrade

terraform plan

#terraform destroy
 
terraform apply -auto-approve

rm ./profider.tf > /dev/null 2>&1 || true
