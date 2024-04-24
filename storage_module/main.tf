terraform {
  required_version = ">= 1.6.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "remote" {
    organization = "AlishaTForg"
    workspaces {
      name = "Terraformgithubactions"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
sa_name = format("storageacct%s%s000", var.assetname, var.enviroment)
}


module "storage_module" {
  source = "github.com/arand18/terraform-modules/storage_module"

  count = var.instance_count

  name = "${local.sa_name}${count.index + 1}"
  resource_group_name = var.resource_group_name
  location = var.resource_group_location

  account_kind = "BlobStorage"
  account_tier = "Standard"
  account_replication_type = "LRS"
  access_tier = "Hot"
  enable_https_traffic_only = true
  public_network_access_enabled = true

  tags = {
    enviroment = var.enviroment
    owner = var.owner
    location = var.resource_group_location
  }
  
}


