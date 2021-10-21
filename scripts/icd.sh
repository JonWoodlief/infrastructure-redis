export SECRETS_MANAGER_URL=https://00a3373c-2e31-4f65-a4ae-c4b51598ad6d.us-south.secrets-manager.appdomain.cloud

ibmcloud target -r us-south
ibmcloud cdb deployment-configuration redis '{"configuration":{"maxmemory-policy":"volatile-lru", "appendonly":"no", "stop-writes-on-bgsave-error":"no"}}'

passwd=$(ibmcloud resource service-key-create jon-credential2 --instance-id "$1" --output json | jq -r '.credentials.connection.rediss.authentication.password')

ibmcloud sm secret-create --secret-type username_password --resources $(cat scripts/secret.json | envsubst)


# ibmcloud resource service-key-create jon-credential --instance-id "$1"
#passwd=$(echo "$1" | grep -oE "password\:\S*" | cut -c 10-)

#echo "$passwd" > ex3
#echo "${1}" > ex
