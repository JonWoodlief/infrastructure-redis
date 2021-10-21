#export SECRETS_MANAGER_URL=https://00a3373c-2e31-4f65-a4ae-c4b51598ad6d.us-south.secrets-manager.appdomain.cloud
export SECRETS_MANAGER_URL="$2"
export dbname="$3"

ibmcloud target -r us-south
ibmcloud cdb deployment-configuration "$3" '{"configuration":{"maxmemory-policy":"volatile-lru", "appendonly":"no", "stop-writes-on-bgsave-error":"no"}}'

export passwd=$(ibmcloud resource service-key-create cm-credentials --instance-id "$1" --output json | jq -r '.credentials.connection.rediss.authentication.password')

cat scripts/secret.json | envsubst
ibmcloud sm secret-create --secret-type username_password --resources $(cat scripts/secret.json | envsubst)
