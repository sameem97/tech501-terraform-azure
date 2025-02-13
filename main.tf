terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_resource_group" "rg" {
  name = "tech501"
}

data "azurerm_virtual_network" "vnet" {
  name                = "tech501-sameem-2-subnet-vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_network_security_group" "app_nsg" {
  name                = "tech501-sameem-in-3-subnet-sparta-app-nsg"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_network_security_group" "db_nsg" {
  name                = "tech501-sameem-in-3-subnet-sparta-app-db-nsg"
  resource_group_name = data.azurerm_resource_group.rg.name
  
}

data "azurerm_ssh_public_key" "ssh" {
  name                = "tech501-sameem-az-key"
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "networking" {
  source                    = "./networking-module"
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  app_subnet_id                 = data.azurerm_subnet.public_subnet.id
  db_subnet_id                  = data.azurerm_subnet.private_subnet.id
  app_network_security_group_id = data.azurerm_network_security_group.app_nsg.id
  db_network_security_group_id = data.azurerm_network_security_group.db_nsg.id
  public_key                = var.public_key
}

module "db" {
  source     = "./db-module"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  db_source_image_id = var.db_source_image_id
  public_key         = var.public_key
  network_interface_id = module.networking.db_network_interface_id
  depends_on = [module.networking]
}

module "app" {
  source               = "./app-module"
  app_source_image_id  = var.app_source_image_id
  resource_group_name  = data.azurerm_resource_group.rg.name
  location             = data.azurerm_resource_group.rg.location
  network_interface_id = module.networking.app_network_interface_id
  public_key           = var.public_key
  depends_on           = [module.db]
}