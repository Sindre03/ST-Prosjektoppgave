resource "azurerm_network_security_group" "nsg_server" {
  name                        = var.server_nsg_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_dc" {
  name                        = var.dc_nsg_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_dmz" {
  name                        = var.dmz_nsg_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_admin" {
  name                        = var.admin_nsg_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "server_assoc" {
  subnet_id                   = azurerm_subnet.snet_server.id
  network_security_group_id   = azurerm_network_security_group.nsg_server.id
}

resource "azurerm_subnet_network_security_group_association" "dc_assoc" {
  subnet_id                   = azurerm_subnet.snet_dc.id
  network_security_group_id   = azurerm_network_security_group.nsg_dc.id
}

resource "azurerm_subnet_network_security_group_association" "dmz_assoc" {
  subnet_id                   = azurerm_subnet.snet_dmz.id
  network_security_group_id   = azurerm_network_security_group.nsg_dmz.id
}

resource "azurerm_subnet_network_security_group_association" "admin_assoc" {
  subnet_id                   = azurerm_subnet.snet_admin.id
  network_security_group_id   = azurerm_network_security_group.nsg_admin.id
}

#Admin til dc regel
resource "azurerm_network_security_rule" "admin_to_dc_rdp" {
  name                        = "Allow-Admin-To-DC-RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "3389"

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dc.name
}

#Admin til dc regel
resource "azurerm_network_security_rule" "admin_to_dc_dns" {
  name                        = "Allow-Admin-To-DC-DNS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "53"

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dc.name
}

#Admin til dc regel
resource "azurerm_network_security_rule" "admin_to_dc_ad" {
  name                        = "Allow-Admin-To-DC-AD"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"

  destination_port_ranges = [
    "88",
    "135",
    "389",
    "445",
    "636"
  ]

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dc.name
}

#Admin til server regel
resource "azurerm_network_security_rule" "admin_to_server_rdp" {
  name                        = "Allow-Admin-To-Server-RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "3389"

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_server.name
}

#Admin til server regel
resource "azurerm_network_security_rule" "admin_to_server_smb" {
  name                        = "Allow-Admin-To-Server-SMB"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "445"

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_server.name
}

#Server til DC regel
resource "azurerm_network_security_rule" "server_to_dc_ad" {
  name                        = "Allow-Server-To-DC-AD"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"

  destination_port_ranges = [
    "53",
    "88",
    "135",
    "389",
    "445",
    "636"
  ]

  source_address_prefix       = local.server_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dc.name
}

#Internett til dmz regel
resource "azurerm_network_security_rule" "internet_to_dmz_http" {
  name                        = "Allow-Internet-To-DMZ-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "80"

  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dmz.name
}

#Internett til dmz regel
resource "azurerm_network_security_rule" "internet_to_dmz_https" {
  name                        = "Allow-Internet-To-DMZ-HTTPS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "443"

  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dmz.name
}

#Admin til dmz regel
resource "azurerm_network_security_rule" "admin_to_dmz_ssh" {
  name                        = "Allow-Admin-To-DMZ-SSH"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "22"

  source_address_prefix       = local.admin_subnet_cidr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dmz.name
}

#Blokkering mot server regel
resource "azurerm_network_security_rule" "deny_dmz_to_server" {
  name                        = "Deny-DMZ-To-Server"
  priority                    = 130
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "*"
  destination_address_prefix  = local.server_subnet_cidr

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dmz.name
}

#Blokkering mot dc regel
resource "azurerm_network_security_rule" "deny_dmz_to_dc" {
  name                        = "Deny-DMZ-To-DC"
  priority                    = 140
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "*"
  destination_address_prefix  = local.dc_subnet_cidr

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_dmz.name
}