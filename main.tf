resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "./scripts/icd.sh ${ibm_database.redis.id}"
    # command = "./scripts/icd.sh \"${jsonencode(ibm_resource_key.cmcred.credentials)}\""
    # command = "echo ${jsonencode(ibm_resource_key.cmcred.credentials)} | jq > ex"
    # command = "echo ${jsonencode(ibm_resource_key.cmcred.credentials)} > ex"
    # command = "echo ${yamlencode(ibm_resource_key.cmcred.credentials)} > ex"
    # command = "echo ${ibm_resource_key.cmcred.credentials} > ex"
    # command = "cat main.tf > ex2"
  }
  # depends_on = [ibm_database.redis]
  depends_on = [ibm_resource_key.cmcred]
}
##############################################################################
#                       This file creates a redis DB                         #
##############################################################################
resource "ibm_database" "redis" {
    resource_group_id            = "7062433cf68d4002baf46488c1c0fb62"
    name                         = "redis"
    service                      = "databases-for-redis"
    plan                         = "standard"
    location                     = "us-south"
    service_endpoints            = "public-and-private"
    auto_scaling {
        cpu {
            # rate_limit_count_per_member = 30
            # rate_limit_count_per_member = 0
        }
        disk {
            # rate_limit_mb_per_member = 3670016
            # rate_limit_mb_per_member = 0
        }
        memory {
            # rate_limit_mb_per_member = 114688
            # rate_limit_mb_per_member = 0
        }
    }
    members_cpu_allocation_count = 6
    tags = ["cm", "tf-test"]
    version = "5"
}

resource "ibm_resource_key" "cmcred" {
  name                 = "cm-credentials"
  resource_instance_id = ibm_database.redis.id
  role = "Administrator"
}

provider "ibm" {
  region           = "us-south"
}
