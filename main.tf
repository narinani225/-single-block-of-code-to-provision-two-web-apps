
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}
/*
#Service connection for comapany Subscription
provider "azurerm" {
  subscription_id = "664b6097-19f2-42a3-be95-a4a6b4069f6b"
  tenant_id       = "0adb040b-ca22-4ca6-9447-ab7b049a22ff"
  client_id       = "44b6dcc1-e3f2-4c7f-b0a4-bbd4e73d97d3"
  client_secret   = "bMq8Q~2JTMh.QMyv7t0w.n4_ad9s49yvHIWI.bFV"
  features {}
  skip_provider_registration = "true"
}
*/
provider "azurerm" {
  subscription_id = "3d0021b5-68cf-46a0-a5fc-ceef26c4e4e1"
  tenant_id       = "503bb7b3-89b7-4714-a6b7-0a79deaffa3d"
  client_id       = "6cb4d5ea-e6d2-4357-8652-e3566ee1914f"
  client_secret   = "kU28Q~eVGQmdVClZmYRuR1eoc~-Q2wCeE8niyadY"
  features {}
  skip_provider_registration = "true"
}


module "aspplaneinfo" {
  source   = "./modules/asp"
  aspplan  = var.aspplan
  Rgname   = var.Rgname
  location = var.location
  sku_name = var.sku_name
  os_type  = var.os_type
  tags     = var.tags
}
module "webserviceeinfo" {
  source   = "./modules/webapp"
  webnames = var.webnames
  Rgname   = var.Rgname
  location = var.location
  aspid    = module.aspplaneinfo.aspplanid
  tags     = var.tags
  depends_on = [
    module.aspplaneinfo
  ]
}