terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate83877"
    container_name       = "tfstate"
    key                  = "sc200-kql-lab.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "sentinel_lab" {
  name     = "rg-sentinel-kql-lab"
  location = "East US"
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = "law-sentinel-${random_string.suffix.result}"
  location            = azurerm_resource_group.sentinel_lab.location
  resource_group_name = azurerm_resource_group.sentinel_lab.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Microsoft Sentinel
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
}

# Random suffix for unique naming
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Sample Windows Security Events solution
resource "azurerm_log_analytics_solution" "security_events" {
  solution_name         = "SecurityInsights"
  location              = azurerm_resource_group.sentinel_lab.location
  resource_group_name   = azurerm_resource_group.sentinel_lab.name
  workspace_resource_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.sentinel_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}