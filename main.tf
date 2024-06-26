resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# Gerar grupo de recursos
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Criar Rede Virtual
resource "azurerm_virtual_network" "myvnet" {
  name                = "acme-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Criar SubNet para as VM's
resource "azurerm_subnet" "my_backend_subnet" {
  name                 = "acme-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.1.0.0/24"]
}