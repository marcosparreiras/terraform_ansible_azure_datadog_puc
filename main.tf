resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# Gerar grupo de recursos
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}