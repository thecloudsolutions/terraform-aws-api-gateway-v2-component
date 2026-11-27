variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "integration_id" {
  type        = string
  description = "(Required) Identifier of the aws_apigatewayv2_integration."
}

variable "integration_response_key" {
  type        = string
  description = "(Required) Integration response key."
}

variable "content_handling_strategy" {
  type        = string
  default     = null
  description = "(Optional) How to handle response payload content type conversions. Valid values: CONVERT_TO_BINARY, CONVERT_TO_TEXT."
}

variable "response_templates" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client."
}

variable "template_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The template selection expression for the integration response."
}
