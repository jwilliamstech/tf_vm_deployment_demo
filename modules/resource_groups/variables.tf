variable "rg_suffix" {
  type        = string
  default     = "rg"
  description = "Suffix of the resource group name that's combined with name of the resource group."
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "West US"
}

variable "default_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}