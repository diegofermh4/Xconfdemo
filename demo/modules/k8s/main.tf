resource "azurerm_container_registry" "acr" {
  name                     = "xconf2020ACR"
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  sku                      = "Basic"
  admin_enabled            = false
}