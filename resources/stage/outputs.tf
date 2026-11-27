output "id" {
  value       = aws_apigatewayv2_stage.this.id
  description = "Stage identifier."
}

output "arn" {
  value       = aws_apigatewayv2_stage.this.arn
  description = "ARN of the stage."
}

output "execution_arn" {
  value       = aws_apigatewayv2_stage.this.execution_arn
  description = "ARN prefix to be used in an aws_lambda_permission's source_arn attribute. For WebSocket APIs this attribute can additionally be used in an aws_iam_policy to authorize access to the @connections API."
}

output "invoke_url" {
  value       = aws_apigatewayv2_stage.this.invoke_url
  description = "URL to invoke the API pointing to the stage, e.g., wss://z4675bid1j.execute-api.eu-west-2.amazonaws.com/example-stage, or https://z4675bid1j.execute-api.eu-west-2.amazonaws.com/"
}

output "tags_all" {
  value       = aws_apigatewayv2_stage.this.tags_all
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}