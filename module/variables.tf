variable "api" {
  type = object({
    name                         = string
    protocol_type                = string
    region                       = optional(string)
    api_key_selection_expression = optional(string)
    body                         = optional(string)
    # (Optional) OpenAPI JSON or YAML. Do not also manage the same routes and integrations through their maps.
    cors_configuration = optional(object({
      allow_credentials = optional(bool)
      allow_headers     = optional(set(string))
      allow_methods     = optional(set(string))
      allow_origins     = optional(set(string))
      expose_headers    = optional(set(string))
      max_age           = optional(number)
    }))
    credentials_arn              = optional(string)
    description                  = optional(string)
    disable_execute_api_endpoint = optional(bool)
    fail_on_warnings             = optional(bool)
    ip_address_type              = optional(string)
    route_key                    = optional(string)
    route_selection_expression   = optional(string)
    target                       = optional(string)
    # (Optional) Quick-create target. AWS owns the generated integration, route and default stage.
    api_gateway_version = optional(string)
    tags                = optional(map(string))
  })
  default     = null
  description = "(Optional) API configuration. Omit when managing children of an existing API through their explicit api_id fields."
}

variable "authorizers" {
  type = map(object({
    api_id                            = optional(string)
    region                            = optional(string)
    name                              = string
    authorizer_type                   = string
    authorizer_credentials_arn        = optional(string)
    authorizer_payload_format_version = optional(string)
    authorizer_result_ttl_in_seconds  = optional(number)
    authorizer_uri                    = optional(string)
    enable_simple_responses           = optional(bool)
    identity_sources                  = optional(set(string), [])
    jwt_configuration = optional(object({
      audience = optional(set(string))
      issuer   = optional(string)
    }))
    timeouts = optional(object({
      delete = optional(string)
    }))
  }))
  default     = {}
  description = "(Optional) Authorizers. Omitted api_id and region use the managed API and its region."
}

variable "vpc_links" {
  type = map(object({
    name               = string
    region             = optional(string)
    security_group_ids = set(string)
    subnet_ids         = set(string)
    tags               = optional(map(string))
  }))
  default     = {}
  description = "(Optional) VPC links for private HTTP integrations. Omitted region uses the managed API region."
}

variable "integrations" {
  type = map(object({
    api_id           = optional(string)
    region           = optional(string)
    integration_type = string
    connection_id    = optional(string)
    # (Optional) Explicit VPC link ID. Takes precedence over vpc_link_custom_name.
    vpc_link_custom_name = optional(string)
    # (Optional) Key in vpc_links. Set connection_type to VPC_LINK for a private integration.
    connection_type           = optional(string)
    content_handling_strategy = optional(string)
    credentials_arn           = optional(string)
    description               = optional(string)
    integration_method        = optional(string)
    integration_subtype       = optional(string)
    integration_uri           = optional(string)
    passthrough_behavior      = optional(string)
    payload_format_version    = optional(string)
    request_parameters        = optional(map(string))
    request_templates         = optional(map(string))
    response_parameters = optional(set(object({
      status_code = string
      mappings    = map(string)
    })), [])
    template_selection_expression = optional(string)
    timeout_milliseconds          = optional(number)
    tls_config = optional(object({
      server_name_to_verify = optional(string)
    }))
  }))
  default     = {}
  description = "(Optional) Integrations shared by routes. Omitted api_id and region use the managed API and its region."
}

variable "routes" {
  type = map(object({
    api_id    = optional(string)
    region    = optional(string)
    route_key = string
    target    = optional(string)
    # (Optional) Native integrations/ID target. Takes precedence over integration_custom_name.
    integration_custom_name = optional(string)
    # (Optional) Key in integrations. Multiple routes can reference the same integration.
    authorizer_id = optional(string)
    # (Optional) Explicit authorizer ID. Takes precedence over authorizer_custom_name.
    authorizer_custom_name = optional(string)
    # (Optional) Key in authorizers. Set authorization_type to JWT or CUSTOM as appropriate.
    authorization_type         = optional(string)
    authorization_scopes       = optional(set(string), [])
    api_key_required           = optional(bool)
    model_selection_expression = optional(string)
    operation_name             = optional(string)
    request_models             = optional(map(string))
    request_parameter = optional(set(object({
      request_parameter_key = string
      required              = bool
    })), [])
    route_response_selection_expression = optional(string)
  }))
  default     = {}
  description = "(Optional) Routes. Omitted api_id and region use the managed API and its region."
}

variable "deployments" {
  type = map(object({
    api_id      = optional(string)
    region      = optional(string)
    description = optional(string)
    triggers    = optional(map(string), {})
    # (Optional) Additional redeployment triggers. The redeployment key is reserved for the managed API configuration hash.
  }))
  default     = {}
  description = "(Optional) Explicit deployments for stages without auto_deploy. Changes to API, authorizer, integration and route configuration trigger redeployment."
}

variable "stages" {
  type = map(object({
    api_id      = optional(string)
    region      = optional(string)
    name        = string
    auto_deploy = optional(bool)
    # (Optional) Enable automatic HTTP API deployments. Do not combine with deployment_id or deployment_custom_name.
    deployment_id = optional(string)
    # (Optional) Explicit deployment ID. Takes precedence over deployment_custom_name.
    deployment_custom_name = optional(string)
    # (Optional) Key in deployments. Use for a stage without auto_deploy.
    access_log_settings = optional(object({
      destination_arn = string
      format          = string
    }))
    client_certificate_id = optional(string)
    default_route_settings = optional(object({
      data_trace_enabled       = optional(bool)
      detailed_metrics_enabled = optional(bool)
      logging_level            = optional(string)
      throttling_burst_limit   = optional(number)
      throttling_rate_limit    = optional(number)
    }))
    description = optional(string)
    route_settings = optional(set(object({
      route_key                = string
      data_trace_enabled       = optional(bool)
      detailed_metrics_enabled = optional(bool)
      logging_level            = optional(string)
      throttling_burst_limit   = optional(number)
      throttling_rate_limit    = optional(number)
    })), [])
    stage_variables = optional(map(string))
    tags            = optional(map(string))
  }))
  default     = {}
  description = "(Optional) Stages with independent access logs, throttling and deployment selection. Omitted api_id and region use the managed API and its region."
}

variable "domain_names" {
  type = map(object({
    domain_name = string
    region      = optional(string)
    domain_name_configuration = object({
      certificate_arn                        = string
      endpoint_type                          = string
      security_policy                        = string
      ip_address_type                        = optional(string)
      ownership_verification_certificate_arn = optional(string)
    })
    mutual_tls_authentication = optional(object({
      truststore_uri     = string
      truststore_version = optional(string)
    }))
    routing_mode = optional(string)
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
    tags = optional(map(string))
  }))
  default     = {}
  description = "(Optional) Custom domains. Omitted region uses the managed API region."
}

variable "api_mappings" {
  type = map(object({
    api_id      = optional(string)
    region      = optional(string)
    domain_name = optional(string)
    # (Optional) Explicit domain name. Takes precedence over domain_name_custom_name.
    domain_name_custom_name = optional(string)
    # (Optional) Key in domain_names. Required when domain_name is omitted.
    stage = optional(string)
    # (Optional) Explicit stage name. Takes precedence over stage_custom_name.
    stage_custom_name = optional(string)
    # (Optional) Key in stages. Required when stage is omitted.
    api_mapping_key = optional(string)
  }))
  default     = {}
  description = "(Optional) Mappings to managed or existing domains and stages. Omitted api_id and region use the managed API and its region."
}
