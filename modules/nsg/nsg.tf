resource "azurerm_network_security_group" "endpoint_nsg" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_rg_name
}

# Allow SSH for Linux (Ansible & Bastion)
resource "azurerm_network_security_rule" "allow_ssh_from_bastion" {
  name                        = "AllowSSHFromBastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.hub_endpoint_subnet_prefix
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.endpoint_nsg.name
}

# Allow WinRM for Windows (Ansible)
resource "azurerm_network_security_rule" "allow_winrm_from_bastion" {
  name                        = "AllowWinRMFromBastion"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5986" # HTTPS WinRM port
  source_address_prefix       = var.hub_endpoint_subnet_prefix
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.endpoint_nsg.name
}

# Allow RDP (Optional Bastion access)
resource "azurerm_network_security_rule" "allow_rdp_from_bastion" {
  name                        = "AllowRDPFromBastion"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = var.hub_endpoint_subnet_prefix
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.endpoint_nsg.name
}