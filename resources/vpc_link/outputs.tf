output "id" {
  value       = aws_apigatewayv2_vpc_link.this.id
  description = "VPC Link identifier."
}

output "arn" {
  value       = aws_apigatewayv2_vpc_link.this.arn
  description = "VPC Link ARN."
}

output "tags_all" {
  value       = aws_apigatewayv2_vpc_link.this.tags_all
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
