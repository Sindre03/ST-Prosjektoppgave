#resource "azurerm_recovery_services_vault" "vault" {
#  name                = var.recovery_vault_name
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#
#  sku = "Standard"
#
#  soft_delete_enabled = true
#
#}