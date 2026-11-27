resource "aws_apigatewayv2_model" "this" {
  region       = var.region
  api_id       = var.api_id
  content_type = var.content_type
  name         = var.name
  schema       = var.schema
  description  = var.description
}
