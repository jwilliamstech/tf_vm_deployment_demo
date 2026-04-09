# ========================== service principal ========================================

variable "sp-subscription-id" {
  description = "Id of the azure subscription where all resources will be created"
  type        = string
}
variable "sp-client-id" {
  description = "Client Id of A Service Principal or Azure Active Directory application registration used for provisioning azure resources."
  type        = string
}
variable "sp-client-secret" {
  description = "Secret of A Service Principal or Azure Active Directory application registration used for provisioning azure resources."
  type        = string
}
variable "sp-tenant-id" {
  description = "Tenant Id of the azure account."
  type        = string
}

# ========================== location ====================================

variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  type        = string
  default     = "West US"
}

# ========================== resource groups =============================

variable "rg_suffix" {
  type        = string
  default     = "rg"
  description = "Suffix of the resource group name that's combined with name of the resource group."
}

variable "hub_rg_name" {
  description = "Name of the hub resource group name for the project"
  type        = string
  default     = "tf-hub-rg-demo"
}

variable "hub_rg_location" {
  type        = string
  default     = "West US"
  description = "Location of the hub resource group for the project."
}

variable "spoke_rg_name" {
  description = "Name of the spoke resource group name for the project"
  type        = string
  default     = "tf-spoke-demo"
}

variable "spoke_rg_location" {
  type        = string
  default     = "West US"
  description = "Location of the spoke resource group for the project."
}

# ========================== virtual networking ==========================

variable "vnet_suffix" {
  type        = string
  default     = "vnet"
  description = "Suffix of the virtual network name that's combined with name of the virtual network."
}

variable "subnet_suffix" {
  type        = string
  default     = "subnet"
  description = "Suffix of the subnet name that's combined with name of the subnet."
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
  default     = "tf-vm-hub"
}

variable "hub_vnet_address_space" {
  description = "Specifies the address space of the hub virtual network"
  type        = list(string)
  default     = [""]
}

variable "hub_vnet_rg_name" {
  description = "Name of the hub virtual network"
  type        = string
  default     = ""
}

variable "hub_vnet_location" {
  description = "Location of hub the virtual network"
  type        = string
  default     = ""
}

variable "hub_gateway_subnet_name" {
  description = "Name of the hub gateway subnet"
  type        = string
  default     = "tf-vm-hub-gateway"
}

variable "hub_gateway_subnet_address_prefixes" {
  description = "Specifies the address space of the hub gateway subnet"
  type        = list(string)
  default     = [""]
}

variable "hub_endpoint_subnet_name" {
  description = "Name of the hub endpoint subnet"
  type        = string
  default     = "tf-vm-hub-endpoint"
}

variable "hub_endpoint_subnet_address_prefixes" {
  description = "Specifies the address space of the hub endpoint subnet"
  type        = list(string)
  default     = [""]
}

variable "spoke_vnet_name" {
  description = "Name of the spoke virtual network"
  type        = string
  default     = "tf-vm-spoke"
}

variable "spoke_vnet_address_space" {
  description = "Specifies the address space of the spoke virtual network"
  type        = list(string)
  default     = [""]
}

variable "spoke_vnet_rg_name" {
  description = "Name of the spoke virtual network"
  type        = string
  default     = ""
}

variable "spoke_vnet_location" {
  description = "Location of the spoke virtual network"
  type        = string
  default     = ""
}

variable "spoke_gateway_subnet_name" {
  description = "Name of the gateway subnet"
  type        = string
  default     = ""
}

variable "spoke_gateway_subnet_address_prefixes" {
  description = "Specifies the address prefix of the gateway subnet"
  type        = list(string)
  default     = [""]
}

variable "spoke_endpoint_subnet_name" {
  description = "Name of the endpoint subnet"
  type        = string
  default     = ""
}

variable "spoke_endpoint_subnet_address_prefixes" {
  description = "Specifies the address prefix of the endpoint subnet"
  type        = list(string)
  default     = [""]
}

# ========================== bastion host ================================

/*variable "bastion_name" {
  description = "Specifies the name of the bastion host"
  type        = string
}

variable "bastion_subnet_name" {
  description = "Specifies the name of the bastion subnet"
  type        = string
}

variable "bastion_rg_name" {
  description = "Specifies the name of the resource group for the bastion host"
  type        = string
}

variable "bastion_pip_name" {
  description = "Specifies the name of the public IP address for the bastion host"
  type        = string
  #default = "tf-aks-demo-bastion-pip"
}

variable "bastion_sku" {
  description = "Specifies the SKU of the bastion host"
  type        = string
  #default        = "basic"
}*/

/*# ========================== jumpbox =====================================
variable "jumpbox_rg_name" {
  description = "Specifies the name of the resource group for the jumpbox"
  type        = string
}

variable "jumpbox_location" {
  description = "Specifies the location of the jumpbox"
  type        = string
}

variable "jumpbox_admin_username" {
  description = "Specifies the admin username of the jumpbox"
  type        = string
  sensitive   = true
}

variable "jumpbox_admin_password" {
  description = "Specifies the admin password of the jumpbox"
  type        = string
  sensitive   = true
}

variable "nsg_allowed_ip_range" {
  description = "Specifies the allowed IP range to connect to the jumpbox NSG"
  type        = string
}*/

# ========================== tags ========================================

variable "default_tags" {
  type = map(any)
  default = {
    "Project"   = "TF-VM-Deployment-Demo"
    "Owner"     = "Joshua Williams"
    "CreatedBy" = "Joshua Williams"
  }
}
