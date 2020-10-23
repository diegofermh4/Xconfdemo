resource "azurerm_container_registry" "acr" {
  name                     = "ACRXconf2020${random_string.random.result}" 
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  sku                      = "Basic"
  admin_enabled            = false
}

resource "random_string" "random" {
  length =  8
  special = false 
}

