
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "664b6097-19f2-42a3-be95-a4a6b4069f6b"
  tenant_id       = "0adb040b-ca22-4ca6-9447-ab7b049a22ff"
  client_id       = "44b6dcc1-e3f2-4c7f-b0a4-bbd4e73d97d3"
  client_secret   = "bMq8Q~2JTMh.QMyv7t0w.n4_ad9s49yvHIWI.bFV"
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