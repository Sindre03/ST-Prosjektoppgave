subscription_id = "bbfda792-6928-4301-890f-105cc93a9c21"

resource_group_name    = "fsi-bedrift"
location               = "Norway East"

vnet_name              = "vnet-bedrift"
vnet_address_space     = ["10.10.0.0/16"]

server_subnet_name     = "snet-server"
server_subnet_address  = ["10.10.10.0/24"]

dc_subnet_name         = "snet-dc"
dc_subnet_address      = ["10.10.11.0/24"]

dmz_subnet_name        = "snet-dmz"
dmz_subnet_address     = ["10.10.30.0/24"]

admin_subnet_name      = "snet-admin"
admin_subnet_address   = ["10.10.100.0/24"]

bastion_subnet_address = ["10.10.200.0/26"]

server_nsg_name        = "nsg-server"

dc_nsg_name            = "nsg-dc"

dmz_nsg_name           = "nsg-dmz"

admin_nsg_name         = "nsg-admin"

bastion_public_ip_name = "pip-bastion"

bastion_name           = "bas-bedrift"

admin_username         = "azureadmin"

admin_password         = "PassordPassord123"

storage_account_name   = "stbedrift01"

recovery_vault_name    = "rsv-bedrift-prod"

