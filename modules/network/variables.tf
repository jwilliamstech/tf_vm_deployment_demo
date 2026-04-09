# ========================== virtual netowrking ==========================

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "Specifies the address space of the virtual virtual network"
  type        = list(string)
  default     = [""]
}

variable "vnet_rg_name" {
  description = "Name of the virtual network"
  type        = string
  default     = ""
}

variable "vnet_location" {
  description = "Location of the virtual network"
  type        = string
  default     = ""
}

variable "gateway_subnet_name" {
  description = "Name of the gateway subnet"
  type        = string
  default     = ""
}

variable "gateway_subnet_address_prefixes" {
  description = "Specifies the address prefix of the gateway subnet"
  type        = list(string)
  default     = [""]
}

variable "endpoint_subnet_name" {
  description = "Name of the endpoint subnet"
  type        = string
  default     = ""
}

variable "endpoint_subnet_address_prefixes" {
  description = "Specifies the address prefix of the endpoint subnet"
  type        = list(string)
  default     = [""]
}