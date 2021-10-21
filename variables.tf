##############################################################################
# Context Variables
##############################################################################
variable "environment" {
  description = "Which environment this is... test or prod"
  default     = "prod"
  type        = string
}

variable "ibm_region" {
  description = "IBM Cloud region where all DB resources will be created"
  default     = "us-south"
  type        = string
}

variable "resource_group_id" {
  description = "ID of resource group to create Cloudant Resources"
  type        = string
}

variable "name_prefix" {
  description = "resources name will be prefixed wit this value.  Naming convention is typically prefix-$region-$environment"
  type        = string
  default     = "cm"
}

variable "secrets_manager_url" {
  description = "secrets manager url"
  type = string
}

############################################################################## 
# Database  Variables
##############################################################################
variable "db_name" {
  description = "Name to use for the DB instance, if not set will be using cm-cloudant-{var.ibm_region}-{var.environment}"
  type        = string
  default     = "_not_set_"
}

##############################################################################
