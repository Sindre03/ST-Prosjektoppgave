variable "subscription_id" {
  description = "subscription id"
  type = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "virtual network address space"
  type        = list(string)
}

variable "server_subnet_name" {
  description = "virtual server subnet name"
  type        = string
}

variable "server_subnet_address" {
  description = "virtual server subnet name"
  type        = list(string)
}

variable "dc_subnet_name" {
  description = "virtual dc subnet name"
  type        = string
}

variable "dc_subnet_address" {
  description = "virtual dc subnet name"
  type        = list(string)
}

variable "dmz_subnet_name" {
  description = "virtual dmz subnet name"
  type        = string
}

variable "dmz_subnet_address" {
  description = "virtual dmz subnet name"
  type        = list(string)
}

variable "admin_subnet_name" {
  description = "virtual admin subnet name"
  type        = string
}

variable "admin_subnet_address" {
  description = "virtual admin subnet name"
  type        = list(string)
}

variable "bastion_subnet_address" {
  description = "virtual bastion subnet name"
  type        = list(string)
}

variable "server_nsg_name" {
  description = "server nsg name"
  type        = string
}

variable "dc_nsg_name" {
  description = "dc nsg name"
  type        = string
}

variable "dmz_nsg_name" {
  description = "dmz nsg name"
  type        = string
}

variable "admin_nsg_name" {
  description = "admin nsg name"
  type        = string
}

variable "bastion_public_ip_name" {
  description = "bastion public ip name"
  type         = string
}

variable "bastion_name" {
  description = "bastion name"
  type        = string
}

variable "admin_username" {
  description = "admin username"
  type        = string
}

variable "admin_password" {
  description = "admin password"
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "storage account name"
  type = string
}

variable "recovery_vault_name" {
  description = "recovery vault name"
  type = string
}

