output "api_mapping_selection_expression" {
  value       = aws_apigatewayv2_domain_name.this.api_mapping_selection_expression
  description = "API mapping selection expression for the domain name."
}

output "arn" {
  value       = aws_apigatewayv2_domain_name.this.arn
  description = "ARN of the domain name."
}

output "id" {
  value       = aws_apigatewayv2_domain_name.this.id
  description = "Domain name identifier."
}

output "tags_all" {
  value       = aws_apigatewayv2_domain_name.this.tags_all
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "domain_name_configuration" {
  value       = aws_apigatewayv2_domain_name.this.domain_name_configuration
  description = "Domain name configuration, including the hosted zone ID and target domain name."
}

output "routing_mode" {
  value       = aws_apigatewayv2_domain_name.this.routing_mode
  description = "Mode used to route traffic for the domain name."
}
