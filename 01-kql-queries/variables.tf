variable "existing_resource_group_name" {
  description = "Name of your existing Sentinel resource group"
  type        = string
  default     = "rg-sentinel-lab"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-sentinel-lab"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "workspace_name_prefix" {
  description = "Prefix for Log Analytics workspace name"
  type        = string
  default     = "law-sentinel"
}

variable "retention_days" {
  description = "Log retention in days"
  type        = number
  default     = 30
}