variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "name" {
  type        = string
  description = "(Required) Name of the API. Must be less than or equal to 128 characters in length."
}

variable "protocol_type" {
  type        = string
  description = "(Required) API protocol. Valid values: HTTP, WEBSOCKET."
}

variable "api_key_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key. Defaults to $request.header.x-api-key. Applicable for WebSocket APIs."
}

variable "cors_configuration" {
  type = object({
    allow_credentials = optional(bool)
    # (Optional) Whether credentials are included in the CORS request.
    allow_headers = optional(set(string))
    # (Optional) Set of allowed HTTP headers.
    allow_methods = optional(set(string))
    # (Optional) Set of allowed HTTP methods.
    allow_origins = optional(set(string))
    # (Optional) Set of allowed origins.
    expose_headers = optional(set(string))
    # (Optional) Set of exposed HTTP headers.
    max_age = optional(number)
    # (Optional) Number of seconds that the browser should cache preflight request results.
  })
  default     = null
  description = "(Optional) Cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs."
}

variable "ip_address_type" {
  type        = string
  default     = null
  description = "(Optional) IP address type that can invoke the API. Valid values: ipv4, dualstack."
}

variable "credentials_arn" {
  type        = string
  default     = null
  description = "(Optional) Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the API. Must be less than or equal to 1024 characters in length."
}

variable "disable_execute_api_endpoint" {
  type        = bool
  default     = null
  description = "(Optional) Whether clients can invoke the API by using the default execute-api endpoint. By default, clients can invoke the API with the default {api_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint."
}

variable "route_key" {
  type        = string
  default     = null
  description = "(Optional) Part of quick create. Specifies any route key. Applicable for HTTP APIs."
}

variable "route_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The route selection expression for the API. Defaults to $request.method $request.path."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of tags to assign to the API. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "target" {
  type        = string
  default     = null
  description = "(Optional) Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Applicable for HTTP APIs."
}

variable "body" {
  type        = string
  default     = null
  description = "(Optional) An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs."
}

variable "api_gateway_version" {
  type        = string
  default     = null
  description = "(Optional) Version identifier for the API. Must be between 1 and 64 characters in length."
}

variable "fail_on_warnings" {
  type        = bool
  default     = null
  description = "(Optional) Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to false. Applicable for HTTP APIs."
}
