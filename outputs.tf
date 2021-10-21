##############################################################################
# Outputs
##############################################################################

output "redis_db_id" {
  value       = ibm_database.redis.id
  description = "Redis instance id"
}

output "redis_db_name" {
  value       = ibm_database.redis.name
  description = "Redis instance name"
}

##############################################################################
