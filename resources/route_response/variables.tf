variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "route_id" {
  type        = string
  description = "(Required) Identifier of the aws_apigatewayv2_route."
}

variable "route_response_key" {
  type        = string
  description = "(Required) Route response key."
}

variable "model_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The model selection expression for the route response."
}

variable "response_models" {
  type        = map(string)
  default     = null
  description = "(Optional) Response models for the route response."
}
