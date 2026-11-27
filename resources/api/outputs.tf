output "id" {
  value       = aws_apigatewayv2_api.this.id
  description = "API identifier."
}

output "api_endpoint" {
  value       = aws_apigatewayv2_api.this.api_endpoint
  description = "URI of the API, of the form https://{api-id}.execute-api.{region}.amazonaws.com for HTTP APIs and wss://{api-id}.execute-api.{region}.amazonaws.com for WebSocket APIs."
}

output "arn" {
  value       = aws_apigatewayv2_api.this.arn
  description = "ARN of the API."
}

output "execution_arn" {
  value       = aws_apigatewayv2_api.this.execution_arn
  description = "ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
}

output "tags_all" {
  value       = aws_apigatewayv2_api.this.tags_all
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "ip_address_type" {
  value       = aws_apigatewayv2_api.this.ip_address_type
  description = "IP address type that can invoke the API."
}
