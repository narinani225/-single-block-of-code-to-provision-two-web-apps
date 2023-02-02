resource "azurerm_windows_web_app" "einfoweb" {
  for_each = toset(var.webnames)
  name                = each.key
  resource_group_name = var.Rgname
  location            = var.location
  service_plan_id     = var.aspid


  site_config {}
  tags = var.tags
}