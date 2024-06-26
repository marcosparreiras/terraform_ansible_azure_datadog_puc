variable "az_subscription_id" {
  type        = string
  description = "azure subscription id"
}

variable "az_tenant_id" {
  type        = string
  description = "azure tenant id"
}

variable "az_client_id" {
  type        = string
  description = "azure client id"
}

variable "az_client_secret" {
  type        = string
  description = "azure clinet secret"
}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Local do grupo de recursos"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefixo para o grupo de recursos que vai ser combinado com um nome randomico."
}