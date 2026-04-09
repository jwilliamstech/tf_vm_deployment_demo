# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = var.vnet_rg_name
  location            = var.vnet_location
  depends_on          = []
}

# Create vnet gateway subnet
resource "azurerm_subnet" "hub_gateway" {
  name                 = var.gateway_subnet_name
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.gateway_subnet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Create endpoint host subnet
resource "azurerm_subnet" "endpoint_subnet" {
  name                                          = var.endpoint_subnet_name
  resource_group_name                           = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = var.endpoint_subnet_address_prefixes
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = false
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

