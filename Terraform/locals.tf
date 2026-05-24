locals {
  server_subnet_cidr  = "10.10.10.0/24"
  
  dc_subnet_cidr      = "10.10.11.0/24"
  
  dmz_subnet_cidr     = "10.10.30.0/24"
  
  admin_subnet_cidr   = "10.10.100.0/24"
  
  vm_dc_name          = "vm-dc-01"
  
  vm_fs_name          = "vm-fs-01"
  
  vm_admin_name       = "vm-admin-01"
  
  vm_docker_name      = "vm-docker-01"
  
  vm_ansible_name     = "vm-ansible-01"

  vm_size             = "Standard_B1s"
}