output "app_service_url" {
  description = "URL do App Service"
  value       = "https://${azurerm_windows_web_app.main.default_hostname}"
}

output "app_service_name" {
  description = "Nome do App Service"
  value       = azurerm_windows_web_app.main.name
}

output "resource_group_name" {
  description = "Nome do Resource Group"
  value       = azurerm_resource_group.main.name
}
