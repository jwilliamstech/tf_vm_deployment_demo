# ========================== nsg ==========================

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = ""
}

variable "nsg_location" {
  description = "Location of the network security group"
  type        = string
  default     = ""
}

variable "nsg_rg_name" {
  description = "Name of the resource group for the network security group"
  type        = string
  default     = ""
}

variable "hub_subnet_prefix" {
  description = "Specifies the address prefix of the hub subnet"
  type        = list(string)
  #default     = [""]
}

variable "rg_name" {
  description = "Name of the resource group for the network security group"
  type        = string
  default     = ""
}