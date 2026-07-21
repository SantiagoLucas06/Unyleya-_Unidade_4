terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# App Service Plan (Windows)
resource "azurerm_service_plan" "main" {
  name                = "${var.project_name}-plan"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Windows"
  sku_name            = "S1"
}

# App Service (Windows com container)
resource "azurerm_windows_web_app" "main" {
  name                = "${var.project_name}-app"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    application_stack {
      current_stack = "docker"
      docker_image  = "${var.docker_hub_username}/${var.docker_image_name}:${var.docker_image_tag}"
      docker_registry_url = "https://index.docker.io"
    }
    
    # Configurações adicionais
    http2_enabled             = true
    min_tls_version           = "1.2"
    health_check_path         = "/"
    health_check_eviction_time_in_min = 2
  }

  app_settings = {
    WEBSITES_PORT               = "5000"
    WEBSITE_USE_ZIP             = "false"
    DOCKER_ENABLE_CI            = "true"
    WEBSITE_RUN_FROM_PACKAGE    = "0"
  }

  tags = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "Terraform"
  }
}
