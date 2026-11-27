output "api_gateway_v2_api_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_id }
  description = "API identifiers by API Gateway definition."
}

output "api_gateway_v2_api_endpoints" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_endpoint }
  description = "API endpoints by API Gateway definition."
}

output "api_gateway_v2_api_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_arn }
  description = "API ARNs by API Gateway definition."
}

output "api_gateway_v2_api_execution_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_execution_arn }
  description = "API execution ARN prefixes for invocation permissions."
}

output "api_gateway_v2_api_ip_address_types" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_ip_address_type }
  description = "IP address types by API Gateway definition."
}

output "api_gateway_v2_api_tags_all" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_tags_all }
  description = "API tags, including provider default tags."
}

output "api_gateway_v2_authorizer_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].authorizer_ids }
  description = "Authorizer identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_vpc_link_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].vpc_link_ids }
  description = "VPC link identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_vpc_link_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].vpc_link_arns }
  description = "VPC link ARNs by API Gateway definition and logical name."
}

output "api_gateway_v2_vpc_link_tags_all" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].vpc_link_tags_all }
  description = "VPC link tags, including provider default tags."
}

output "api_gateway_v2_integration_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].integration_ids }
  description = "Integration identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_integration_response_selection_expressions" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].integration_response_selection_expressions }
  description = "Integration response selection expressions by API Gateway definition and logical name."
}

output "api_gateway_v2_route_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].route_ids }
  description = "Route identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_deployment_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].deployment_ids }
  description = "Deployment identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_deployment_auto_deployed" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].deployment_auto_deployed }
  description = "Whether each deployment was automatically released."
}

output "api_gateway_v2_stage_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].stage_ids }
  description = "Stage identifiers by API Gateway definition and logical name."
}

output "api_gateway_v2_stage_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].stage_arns }
  description = "Stage ARNs by API Gateway definition and logical name."
}

output "api_gateway_v2_stage_execution_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].stage_execution_arns }
  description = "Stage execution ARN prefixes for invocation permissions."
}

output "api_gateway_v2_stage_invoke_urls" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].stage_invoke_urls }
  description = "Stage invocation URLs by API Gateway definition and logical name."
}

output "api_gateway_v2_stage_tags_all" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].stage_tags_all }
  description = "Stage tags, including provider default tags."
}

output "api_gateway_v2_domain_name_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_ids }
  description = "Custom domain names by API Gateway definition and logical name."
}

output "api_gateway_v2_domain_name_arns" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_arns }
  description = "Custom domain ARNs by API Gateway definition and logical name."
}

output "api_gateway_v2_domain_name_configurations" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_configurations }
  description = "Custom domain configurations, including target domain names and hosted zone IDs."
}

output "api_gateway_v2_domain_name_api_mapping_selection_expressions" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_api_mapping_selection_expressions }
  description = "API mapping selection expressions by custom domain."
}

output "api_gateway_v2_domain_name_routing_modes" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_routing_modes }
  description = "Routing modes by custom domain."
}

output "api_gateway_v2_domain_name_tags_all" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].domain_name_tags_all }
  description = "Custom domain tags, including provider default tags."
}

output "api_gateway_v2_api_mapping_ids" {
  value       = { for key in keys(module.api_gateway_v2) : key => module.api_gateway_v2[key].api_mapping_ids }
  description = "API mapping identifiers by API Gateway definition and logical name."
}
