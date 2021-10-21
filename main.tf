resource "null_resource" "script-runner" {
  provisioner "local-exec" {
    command = "./scripts/icd.sh ${ibm_database.redis.id} ${var.secrets_manager_url} ${ibm_database.redis.name}"
  }
  depends_on = [ibm_database.redis]
}
##############################################################################
#                       This file creates a redis DB                         #
##############################################################################
resource "ibm_database" "redis" {
    resource_group_id            = var.resource_group_id
    name              = var.db_name == "_not_set_" ? "${var.name_prefix}-redis-db-${var.ibm_region}-${var.environment}" : var.db_name
    service                      = "databases-for-redis"
    plan                         = "standard"
    location                     = var.ibm_region
    service_endpoints            = "public-and-private"
    auto_scaling {
        cpu {
        }
        disk {
        }
        memory {
        }
    }
    members_cpu_allocation_count = 6
    tags = ["cm", var.environment]
    version = "5"
}

provider "ibm" {
  region           = "us-south"
}
