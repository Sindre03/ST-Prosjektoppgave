resource "azurerm_resource_group" "rg" {
  name                 = var.resource_group_name
  location             = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                 = var.vnet_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name

  address_space        = var.vnet_address_space
}

resource "azurerm_subnet" "snet_server" {
  name                 = var.server_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = var.server_subnet_address
}

resource "azurerm_subnet" "snet_dc" {
  name                 = var.dc_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = var.dc_subnet_address
}

resource "azurerm_subnet" "snet_dmz" {
  name                 = var.dmz_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = var.dmz_subnet_address
}

resource "azurerm_subnet" "snet_admin" {
  name                 = var.admin_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes      = var.admin_subnet_address
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes      = var.bastion_subnet_address
}
