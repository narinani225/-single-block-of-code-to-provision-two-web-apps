resource "azurerm_service_plan" "einfoasp" {
  name                = var.aspplan
  resource_group_name = var.Rgname
  location            = var.location
  sku_name            = var.sku_name
  os_type             = var.os_type
  tags = var.tags
}
