output "id" {
  value       = aws_apigatewayv2_deployment.this.id
  description = "Deployment identifier."
}

output "auto_deployed" {
  value       = aws_apigatewayv2_deployment.this.auto_deployed
  description = "Whether the deployment was automatically released."
}
