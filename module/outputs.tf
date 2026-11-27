output "api_id" {
  value       = var.api != null ? module.api[0].id : null
  description = "API identifier."
}

output "api_endpoint" {
  value       = var.api != null ? module.api[0].api_endpoint : null
  description = "URI of the API."
}

output "api_arn" {
  value       = var.api != null ? module.api[0].arn : null
  description = "ARN of the API."
}

output "api_execution_arn" {
  value       = var.api != null ? module.api[0].execution_arn : null
  description = "API execution ARN prefix for invocation permissions."
}

output "api_ip_address_type" {
  value       = var.api != null ? module.api[0].ip_address_type : null
  description = "IP address type that can invoke the API."
}

output "api_tags_all" {
  value       = var.api != null ? module.api[0].tags_all : null
  description = "API tags, including provider default tags."
}

output "authorizer_ids" {
  value       = { for key, authorizer in module.authorizer : key => authorizer.id }
  description = "Authorizer identifiers by logical name."
}

output "vpc_link_ids" {
  value       = { for key, vpc_link in module.vpc_link : key => vpc_link.id }
  description = "VPC link identifiers by logical name."
}

output "vpc_link_arns" {
  value       = { for key, vpc_link in module.vpc_link : key => vpc_link.arn }
  description = "VPC link ARNs by logical name."
}

output "vpc_link_tags_all" {
  value       = { for key, vpc_link in module.vpc_link : key => vpc_link.tags_all }
  description = "VPC link tags, including provider default tags."
}

output "integration_ids" {
  value       = { for key, integration in module.integration : key => integration.id }
  description = "Integration identifiers by logical name."
}

output "integration_response_selection_expressions" {
  value       = { for key, integration in module.integration : key => integration.integration_response_selection_expression }
  description = "Integration response selection expressions by logical name."
}

output "route_ids" {
  value       = { for key, route in module.route : key => route.id }
  description = "Route identifiers by logical name."
}

output "deployment_ids" {
  value       = { for key, deployment in module.deployment : key => deployment.id }
  description = "Deployment identifiers by logical name."
}

output "deployment_auto_deployed" {
  value       = { for key, deployment in module.deployment : key => deployment.auto_deployed }
  description = "Whether each deployment was automatically released."
}

output "stage_ids" {
  value       = { for key, stage in module.stage : key => stage.id }
  description = "Stage identifiers by logical name."
}

output "stage_arns" {
  value       = { for key, stage in module.stage : key => stage.arn }
  description = "Stage ARNs by logical name."
}

output "stage_execution_arns" {
  value       = { for key, stage in module.stage : key => stage.execution_arn }
  description = "Stage execution ARN prefixes for invocation permissions."
}

output "stage_invoke_urls" {
  value       = { for key, stage in module.stage : key => stage.invoke_url }
  description = "Stage invocation URLs by logical name."
}

output "stage_tags_all" {
  value       = { for key, stage in module.stage : key => stage.tags_all }
  description = "Stage tags, including provider default tags."
}

output "domain_name_ids" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.id }
  description = "Custom domain names by logical name."
}

output "domain_name_arns" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.arn }
  description = "Custom domain ARNs by logical name."
}

output "domain_name_configurations" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.domain_name_configuration }
  description = "Custom domain configurations, including target domain names and hosted zone IDs."
}

output "domain_name_api_mapping_selection_expressions" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.api_mapping_selection_expression }
  description = "API mapping selection expressions by custom domain."
}

output "domain_name_routing_modes" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.routing_mode }
  description = "Routing modes by custom domain."
}

output "domain_name_tags_all" {
  value       = { for key, domain_name in module.domain_name : key => domain_name.tags_all }
  description = "Custom domain tags, including provider default tags."
}

output "api_mapping_ids" {
  value       = { for key, api_mapping in module.api_mapping : key => api_mapping.id }
  description = "API mapping identifiers by logical name."
}
