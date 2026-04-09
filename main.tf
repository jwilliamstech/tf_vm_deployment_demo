# ========================== resource groups ==============================
module "hub_rg" {
  source              = "./modules/resource_groups"
  resource_group_name = lower("${var.hub_rg_name}-${local.environment}-${var.rg_suffix}")
  location            = var.hub_rg_location
}

module "spoke_rg" {
  source              = "./modules/resource_groups"
  resource_group_name = lower("${var.spoke_rg_name}-${local.environment}-${var.rg_suffix}")
  location            = var.spoke_rg_location
}

# ========================== virtual netowrking ==========================
module "hub_network" {
  source                           = "./modules/network"
  vnet_name                        = lower("${var.hub_vnet_name}-${local.environment}-${var.vnet_suffix}")
  vnet_address_space               = var.hub_vnet_address_space
  vnet_rg_name                     = module.hub_rg.resource_group_name
  vnet_location                    = var.hub_vnet_location
  gateway_subnet_name              = lower("${var.hub_gateway_subnet_name}-${local.environment}-${var.subnet_suffix}")
  gateway_subnet_address_prefixes  = var.hub_gateway_subnet_address_prefixes
  endpoint_subnet_name             = lower("${var.hub_endpoint_subnet_name}-${local.environment}-${var.subnet_suffix}")
  endpoint_subnet_address_prefixes = var.hub_endpoint_subnet_address_prefixes


}

module "spoke_network" {
  source                           = "./modules/network"
  vnet_name                        = lower("${var.spoke_vnet_name}-${local.environment}-${var.vnet_suffix}")
  vnet_address_space               = var.spoke_vnet_address_space
  vnet_rg_name                     = module.spoke_rg.resource_group_name
  vnet_location                    = var.spoke_vnet_location
  gateway_subnet_name              = lower("${var.spoke_gateway_subnet_name}-${local.environment}-${var.subnet_suffix}")
  gateway_subnet_address_prefixes  = var.spoke_gateway_subnet_address_prefixes
  endpoint_subnet_name             = lower("${var.spoke_endpoint_subnet_name}-${local.environment}-${var.subnet_suffix}")
  endpoint_subnet_address_prefixes = var.spoke_endpoint_subnet_address_prefixes

}

# ========================== network security groups ==========================

module "spoke_nsg" {
  source                     = "./modules/nsg"
  nsg_name                   = lower("${var.spoke_nsg_name}-${local.environment}-${var.nsg_suffix}")
  nsg_location               = module.spoke_network.vnet_location
  nsg_rg_name                = module.spoke_rg.resource_group_name
  hub_endpoint_subnet_prefix = var.nsg_hub_endpoint_subnet_prefix
  rg_name                    = module.spoke_rg.resource_group_name
}

/*hub_vnet_rg_name                     = var.hub_vnet_rg_name
  hub_location                         = var.hub_location
  hub_vnet_location                    = var.hub_location
  hub_vnet_name                        = var.hub_vnet_name
  hub_vnet_address_space               = var.hub_vnet_address_space
  hub_gateway_subnet_name              = var.hub_gateway_subnet_name
  hub_gateway_subnet_address_prefixes  = var.hub_gateway_subnet_address_prefixes
  hub_bastion_subnet_name              = var.hub_bastion_subnet_name
  hub_bastion_subnet_address_prefixes  = var.hub_bastion_subnet_address_prefixes
  spoke_vnet_name                      = var.spoke_vnet_name
  spoke_vnet_address_space             = var.spoke_vnet_address_space
  jumpbox_subnet_name                  = var.jumpbox_subnet_name
  jumpbox_subnet_address_prefix        = var.jumpbox_subnet_address_prefix
  aks_subnet_name                      = var.aks_subnet_name
  aks_address_prefixes                 = var.aks_address_prefixes
  psql_subnet_name                     = var.psql_subnet_name
  psql_address_prefixes                = var.psql_address_prefixes
  appgtw_subnet_name                   = var.appgtw_subnet_name
  appgtw_address_prefixes              = var.appgtw_address_prefixes
  gateway_subnet_address_prefixes      = var.gateway_subnet_address_prefixes
  vpn_gateway_subnet_address_prefixes  = var.vpn_gateway_subnet_address_prefixes
  hub_firewall_subnet_name             = var.hub_firewall_subnet_name
  hub_firewall_subnet_address_prefixes = var.hub_firewall_subnet_address_prefixes
}*/
/*# ========================== bastion ====================================

module "bastion" {
  source              = "./modules/bastion"
  bastion_name        = var.bastion_name
  bastion_pip_name    = var.bastion_pip_name
  bastion_subnet_id   = module.network.hub_bastion_subnet_id
  bastion_location    = module.network.hub_location
  bastion_rg_name     = module.network.hub_vnet_rg_name
  bastion_subnet_name = module.network.hub_bastion_subnet_name
  bastion_sku         = var.bastion_sku
}*/

/*# ========================== jumpbox ==========================

module "jumpbox" {
  source                 = "./modules/jumpbox"
  jumpbox_location       = module.network.hub_location
  jumpbox_rg_name        = module.network.hub_vnet_rg_name
  jumpbox_subnet_id      = module.network.jumpbox_subnet_id
  jumpbox_admin_username = var.jumpbox_admin_username
  jumpbox_admin_password = var.jumpbox_admin_password
  nsg_allowed_ip_range   = var.nsg_allowed_ip_range
}*/