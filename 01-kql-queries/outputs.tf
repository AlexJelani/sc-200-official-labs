output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.sentinel_lab.name
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.sentinel_workspace.id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.sentinel_workspace.name
}

output "sentinel_workspace_url" {
  description = "URL to access Microsoft Sentinel"
  value       = "https://portal.azure.com/#@/resource${azurerm_log_analytics_workspace.sentinel_workspace.id}/overview"
}