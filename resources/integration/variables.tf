variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "integration_type" {
  type        = string
  description = "(Required) Integration type of an integration. Valid values: AWS (supported only for WebSocket APIs), AWS_PROXY, HTTP (supported only for WebSocket APIs), HTTP_PROXY, MOCK (supported only for WebSocket APIs). For an HTTP API private integration, use HTTP_PROXY."
}

variable "connection_id" {
  type        = string
  default     = null
  description = "(Optional) ID of the VPC link for a private integration. Supported only for HTTP APIs. Must be between 1 and 1024 characters in length."
}

variable "connection_type" {
  type        = string
  default     = null
  description = "(Optional) Type of the network connection to the integration endpoint. Valid values: INTERNET, VPC_LINK. Default is INTERNET."
}

variable "content_handling_strategy" {
  type        = string
  default     = null
  description = "(Optional) How to handle response payload content type conversions. Valid values: CONVERT_TO_BINARY, CONVERT_TO_TEXT. Supported only for WebSocket APIs."
}

variable "credentials_arn" {
  type        = string
  default     = null
  description = "(Optional) Credentials required for the integration, if any."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the integration."
}

variable "integration_method" {
  type        = string
  default     = null
  description = "(Optional) Integration's HTTP method. Must be specified if integration_type is not MOCK."
}

variable "integration_subtype" {
  type        = string
  default     = null
  description = "(Optional) AWS service action to invoke. Supported only for HTTP APIs when integration_type is AWS_PROXY. See the AWS service integration reference documentation for supported values. Must be between 1 and 128 characters in length."
}

variable "integration_uri" {
  type        = string
  default     = null
  description = "(Optional) URI of the Lambda function for a Lambda proxy integration, when integration_type is AWS_PROXY. For an HTTP integration, specify a fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service."
}

variable "passthrough_behavior" {
  type        = string
  default     = null
  description = "(Optional) Pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the request_templates attribute. Valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER. Default is WHEN_NO_MATCH. Supported only for WebSocket APIs."
}

variable "payload_format_version" {
  type        = string
  default     = null
  description = "(Optional) The format of the payload sent to an integration. Valid values: 1.0, 2.0. Default is 1.0."
}

variable "request_parameters" {
  type        = map(string)
  default     = null
  description = "(Optional) For WebSocket APIs, a key-value map specifying request parameters that are passed from the method request to the backend. For HTTP APIs with a specified integration_subtype, a key-value map specifying parameters that are passed to AWS_PROXY integrations. For HTTP APIs without a specified integration_subtype, a key-value map specifying how to transform HTTP requests before sending them to the backend."
}

variable "request_templates" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. Supported only for WebSocket APIs."
}

variable "response_parameters" {
  type = set(object({
    status_code = string
    # (Required) HTTP status code in the range 200-599.
    mappings = map(string)
    # (Required) Key-value map. The key of this map identifies the location of the request parameter to change, and how to change it. The corresponding value specifies the new data for the parameter.
  }))
  default     = []
  description = "(Optional) Mappings to transform the HTTP response from a backend integration before returning the response to clients. Supported only for HTTP APIs."
}

variable "template_selection_expression" {
  type        = string
  default     = null
  description = "(Optional) The template selection expression for the integration."
}

variable "timeout_milliseconds" {
  type        = number
  default     = null
  description = "(Optional) Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs. Terraform will only perform drift detection of its value when present in a configuration."
}

variable "tls_config" {
  type = object({
    server_name_to_verify = optional(string)
    # (Optional) If you specify a server name, API Gateway uses it to verify the hostname on the integration's certificate. The server name is also included in the TLS handshake to support Server Name Indication (SNI) or virtual hosting. 
  })
  default     = null
  description = "(Optional) If you specify a server name, API Gateway uses it to verify the hostname on the integration's certificate. The server name is also included in the TLS handshake to support Server Name Indication (SNI) or virtual hosting."
}
