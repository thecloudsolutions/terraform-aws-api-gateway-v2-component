variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "name" {
  type        = string
  description = "(Required) Name of the stage. Must be between 1 and 128 characters in length."
}

variable "access_log_settings" {
  type = object({
    destination_arn = string
    # (Required) ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN.
    format = string
    # (Required) Single line format of the access logs of data. Refer to log settings for HTTP or Websocket.
  })
  default     = null
  description = "(Optional) Settings for logging access in this stage. Use the aws_api_gateway_account resource to configure permissions for CloudWatch Logging."
}

variable "auto_deploy" {
  type        = bool
  default     = null
  description = "(Optional) Whether updates to an API automatically trigger a new deployment. Defaults to false. Applicable for HTTP APIs."
}

variable "client_certificate_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a client certificate for the stage. Use the aws_api_gateway_client_certificate resource to configure a client certificate. Supported only for WebSocket APIs."
}

variable "default_route_settings" {
  type = object({
    data_trace_enabled = optional(bool)
    # (Optional) Whether data trace logging is enabled for the default route. Affects the log entries pushed to Amazon CloudWatch Logs. Defaults to false. Supported only for WebSocket APIs.
    detailed_metrics_enabled = optional(bool)
    # (Optional) Whether detailed metrics are enabled for the default route. Defaults to false.
    logging_level = optional(string)
    # (Optional) Logging level for the default route. Affects the log entries pushed to Amazon CloudWatch Logs. Valid values: ERROR, INFO, OFF. Defaults to OFF. Supported only for WebSocket APIs. Terraform will only perform drift detection of its value when present in a configuration.
    throttling_burst_limit = optional(number)
    # (Optional) Throttling burst limit for the default route.
    throttling_rate_limit = optional(number)
    # (Optional) Throttling rate limit for the default route.
  })
  default     = null
  description = "(Optional) Default route settings for the stage."
}

variable "deployment_id" {
  type        = string
  default     = null
  description = "(Optional) Deployment identifier of the stage. Use the aws_apigatewayv2_deployment resource to configure a deployment."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description for the stage. Must be less than or equal to 1024 characters in length."
}

variable "route_settings" {
  type = set(object({
    route_key = string
    # (Required) Route key.
    data_trace_enabled = optional(bool)
    # (Optional) Whether data trace logging is enabled for the route. Affects the log entries pushed to Amazon CloudWatch Logs. Defaults to false. Supported only for WebSocket APIs.
    detailed_metrics_enabled = optional(bool)
    # (Optional) Whether detailed metrics are enabled for the route. Defaults to false.
    logging_level = optional(string)
    # (Optional) Logging level for the route. Affects the log entries pushed to Amazon CloudWatch Logs. Valid values: ERROR, INFO, OFF. Defaults to OFF. Supported only for WebSocket APIs. Terraform will only perform drift detection of its value when present in a configuration.
    throttling_burst_limit = optional(number)
    # (Optional) Throttling burst limit for the route.
    throttling_rate_limit = optional(number)
    # (Optional) Throttling rate limit for the route.
  }))
  default     = []
  description = "(Optional) Route settings for the stage."
}

variable "stage_variables" {
  type        = map(string)
  default     = null
  description = "(Optional) Map that defines the stage variables for the stage."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of tags to assign to the stage. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
