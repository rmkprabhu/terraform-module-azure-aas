data "azurerm_resource_group" "my_rg" {
  name     = var.rg_name
}

data "azurerm_virtual_network" "my_terraform_network" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_virtual_machine" "myvm" {
  name                  = var.vm_name
  resource_group_name  = var.rg_name_01
}

resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = "${var.vm_name}-public-ip-01"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
}
