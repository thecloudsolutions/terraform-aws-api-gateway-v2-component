variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "authorizer_type" {
  type        = string
  description = "(Required) Authorizer type. Valid values: JWT, REQUEST. Specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens."
}

variable "name" {
  type        = string
  description = "(Required) Name of the authorizer. Must be between 1 and 128 characters in length."
}

variable "authorizer_credentials_arn" {
  type        = string
  default     = null
  description = "(Optional) Required credentials as an IAM role for API Gateway to invoke the authorizer. Supported only for REQUEST authorizers."
}

variable "authorizer_payload_format_version" {
  type        = string
  default     = null
  description = "(Optional) Format of the payload sent to an HTTP API Lambda authorizer. Required for HTTP API Lambda authorizers. Valid values: 1.0, 2.0."
}

variable "authorizer_result_ttl_in_seconds" {
  type        = number
  default     = null
  description = "(Optional) Time to live (TTL) for cached authorizer results, in seconds. If it equals 0, authorization caching is disabled. If it is greater than 0, API Gateway caches authorizer responses. The maximum value is 3600, or 1 hour. Defaults to 300. Supported only for HTTP API Lambda authorizers."
}

variable "authorizer_uri" {
  type        = string
  default     = null
  description = "(Optional) Authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers this must be a well-formed Lambda function URI, such as the invoke_arn attribute of the aws_lambda_function resource. Supported only for REQUEST authorizers. Must be between 1 and 2048 characters in length."
}

variable "enable_simple_responses" {
  type        = bool
  default     = null
  description = "(Optional) Whether a Lambda authorizer returns a response in a simple format. If enabled, the Lambda authorizer can return a boolean value instead of an IAM policy. Supported only for HTTP APIs."
}

variable "identity_sources" {
  type        = set(string)
  default     = []
  description = "(Optional) Identity sources for which authorization is requested. For REQUEST authorizers the value is a list of one or more mapping expressions of the specified request parameters. For JWT authorizers the single entry specifies where to extract the JSON Web Token (JWT) from inbound requests."
}

variable "jwt_configuration" {
  type = object({
    audience = optional(set(string))
    # (Optional) List of the intended recipients of the JWT. A valid JWT must provide an aud that matches at least one entry in this list.
    issuer = optional(string)
    # (Optional) Base domain of the identity provider that issues JSON Web Tokens, such as the endpoint attribute of the aws_cognito_user_pool resource.
  })
  default     = null
  description = "(Optional) Configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs."
}

variable "timeouts" {
  type = object({
    delete = optional(string)
    # Default 30 minutes
  })
  default     = null
  description = "(Optional) Timeouts for the service."
}
