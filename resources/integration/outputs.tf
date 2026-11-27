output "id" {
  value       = aws_apigatewayv2_integration.this.id
  description = "Integration identifier."
}

output "integration_response_selection_expression" {
  value       = aws_apigatewayv2_integration.this.integration_response_selection_expression
  description = "The integration response selection expression for the integration."
}
