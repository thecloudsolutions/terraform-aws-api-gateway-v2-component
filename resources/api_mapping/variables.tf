variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "domain_name" {
  type        = string
  description = "(Required) Domain name. Use the aws_apigatewayv2_domain_name resource to configure a domain name."
}

variable "stage" {
  type        = string
  description = "(Required) API stage. Use the aws_apigatewayv2_stage resource to configure an API stage."
}

variable "api_mapping_key" {
  type        = string
  default     = null
  description = "(Optional) The API mapping key."
}
