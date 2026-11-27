variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "route_key" {
  type        = string
  description = "(Required) Route key for the route. For HTTP APIs, the route key can be either $default, or a combination of an HTTP method and resource path, for example, GET /pets."
}

variable "api_key_required" {
  type        = bool
  default     = null
  description = "(Optional) Boolean whether an API key is required for the route. Defaults to false. Supported only for WebSocket APIs."
}

variable "authorization_scopes" {
  type        = set(string)
  default     = []
  description = "(Optional) Authorization scopes supported by this route. The scopes are used with a JWT authorizer to authorize the method invocation."
}

variable "authorization_type" {
  type        = string
  default     = null
  description = "(Optional) Authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer. For HTTP APIs, valid values are NONE for open access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer. Defaults to NONE."
}

variable "authorizer_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of the aws_apigatewayv2_authorizer resource to be associated with this route."
}

variable "model_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The model selection expression for the route. Supported only for WebSocket APIs."
}

variable "operation_name" {
  type        = string
  default     = null
  description = "(Optional) Operation name for the route. Must be between 1 and 64 characters in length."
}

variable "request_models" {
  type        = map(string)
  default     = null
  description = "(Optional) Request models for the route. Supported only for WebSocket APIs."
}

variable "request_parameter" {
  type = set(object({
    request_parameter_key = string
    # (Required) Request parameter key. This is a request data mapping parameter.
    required = bool
    # (Required) Boolean whether or not the parameter is required.
  }))
  default     = []
  description = "(Optional) Request parameters for the route. Supported only for WebSocket APIs."
}

variable "route_response_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The route response selection expression for the route. Supported only for WebSocket APIs."
}

variable "target" {
  type        = string
  default     = null
  description = "(Optional) Target for the route, of the form integrations/IntegrationID, where IntegrationID is the identifier of an aws_apigatewayv2_integration resource."
}
