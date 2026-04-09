output "vnet_location" {
  value = azurerm_virtual_network.vnet.location
}

output "endpoint_subnet_address_prefixes" {
  value = azurerm_subnet.endpoint_subnet.address_prefixes
}