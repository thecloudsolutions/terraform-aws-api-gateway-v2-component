module "api" {
  source = "../resources/api"

  count = var.api != null ? 1 : 0

  name                         = var.api.name
  protocol_type                = var.api.protocol_type
  region                       = lookup(var.api, "region", null)
  api_key_selection_expression = lookup(var.api, "api_key_selection_expression", null)
  body                         = lookup(var.api, "body", null)
  cors_configuration           = lookup(var.api, "cors_configuration", null)
  credentials_arn              = lookup(var.api, "credentials_arn", null)
  description                  = lookup(var.api, "description", null)
  disable_execute_api_endpoint = lookup(var.api, "disable_execute_api_endpoint", null)
  fail_on_warnings             = lookup(var.api, "fail_on_warnings", null)
  ip_address_type              = lookup(var.api, "ip_address_type", null)
  route_key                    = lookup(var.api, "route_key", null)
  route_selection_expression   = lookup(var.api, "route_selection_expression", null)
  target                       = lookup(var.api, "target", null)
  api_gateway_version          = lookup(var.api, "api_gateway_version", null)

  tags = lookup(var.api, "tags", null)
}

module "authorizer" {
  source = "../resources/authorizer"

  for_each = var.authorizers

  api_id                            = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region                            = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  name                              = each.value.name
  authorizer_type                   = each.value.authorizer_type
  authorizer_credentials_arn        = lookup(each.value, "authorizer_credentials_arn", null)
  authorizer_payload_format_version = lookup(each.value, "authorizer_payload_format_version", null)
  authorizer_result_ttl_in_seconds  = lookup(each.value, "authorizer_result_ttl_in_seconds", null)
  authorizer_uri                    = lookup(each.value, "authorizer_uri", null)
  enable_simple_responses           = lookup(each.value, "enable_simple_responses", null)
  identity_sources                  = lookup(each.value, "identity_sources", [])
  jwt_configuration                 = lookup(each.value, "jwt_configuration", null)
  timeouts                          = lookup(each.value, "timeouts", null)
}

module "vpc_link" {
  source = "../resources/vpc_link"

  for_each = var.vpc_links

  name               = each.value.name
  region             = each.value.region != null ? each.value.region : try(var.api.region, null)
  security_group_ids = each.value.security_group_ids
  subnet_ids         = each.value.subnet_ids

  tags = lookup(each.value, "tags", null)
}

module "integration" {
  source = "../resources/integration"

  for_each = var.integrations

  api_id                        = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region                        = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  integration_type              = each.value.integration_type
  connection_id                 = each.value.connection_id != null ? each.value.connection_id : each.value.vpc_link_custom_name != null ? module.vpc_link[each.value.vpc_link_custom_name].id : null
  connection_type               = lookup(each.value, "connection_type", null)
  content_handling_strategy     = lookup(each.value, "content_handling_strategy", null)
  credentials_arn               = lookup(each.value, "credentials_arn", null)
  description                   = lookup(each.value, "description", null)
  integration_method            = lookup(each.value, "integration_method", null)
  integration_subtype           = lookup(each.value, "integration_subtype", null)
  integration_uri               = lookup(each.value, "integration_uri", null)
  passthrough_behavior          = lookup(each.value, "passthrough_behavior", null)
  payload_format_version        = lookup(each.value, "payload_format_version", null)
  request_parameters            = lookup(each.value, "request_parameters", null)
  request_templates             = lookup(each.value, "request_templates", null)
  response_parameters           = lookup(each.value, "response_parameters", [])
  template_selection_expression = lookup(each.value, "template_selection_expression", null)
  timeout_milliseconds          = lookup(each.value, "timeout_milliseconds", null)
  tls_config                    = lookup(each.value, "tls_config", null)
}

module "route" {
  source = "../resources/route"

  for_each = var.routes

  api_id                              = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region                              = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  route_key                           = each.value.route_key
  target                              = each.value.target != null ? each.value.target : each.value.integration_custom_name != null ? "integrations/${module.integration[each.value.integration_custom_name].id}" : null
  authorizer_id                       = each.value.authorizer_id != null ? each.value.authorizer_id : each.value.authorizer_custom_name != null ? module.authorizer[each.value.authorizer_custom_name].id : null
  authorization_type                  = lookup(each.value, "authorization_type", null)
  authorization_scopes                = lookup(each.value, "authorization_scopes", [])
  api_key_required                    = lookup(each.value, "api_key_required", null)
  model_selection_expression          = lookup(each.value, "model_selection_expression", null)
  operation_name                      = lookup(each.value, "operation_name", null)
  request_models                      = lookup(each.value, "request_models", null)
  request_parameter                   = lookup(each.value, "request_parameter", [])
  route_response_selection_expression = lookup(each.value, "route_response_selection_expression", null)
}

module "deployment" {
  source = "../resources/deployment"

  for_each = var.deployments

  api_id      = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region      = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  description = lookup(each.value, "description", null)
  triggers = merge(each.value.triggers, {
    redeployment = sha1(jsonencode({
      api         = var.api
      authorizers = var.authorizers
      integrations = { for key, integration in var.integrations :
        key => merge(integration,
          { connection_id = integration.connection_id != null ? integration.connection_id : integration.vpc_link_custom_name != null ? module.vpc_link[integration.vpc_link_custom_name].id : null }
        )
      }
      routes          = var.routes
      authorizer_ids  = { for key, authorizer in module.authorizer : key => authorizer.id }
      integration_ids = { for key, integration in module.integration : key => integration.id }
      route_ids       = { for key, route in module.route : key => route.id }
    }))
  })

  depends_on = [module.authorizer, module.integration, module.route]
}

module "stage" {
  source = "../resources/stage"

  for_each = var.stages

  api_id                 = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region                 = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  name                   = each.value.name
  deployment_id          = each.value.deployment_id != null ? each.value.deployment_id : each.value.deployment_custom_name != null ? module.deployment[each.value.deployment_custom_name].id : null
  auto_deploy            = lookup(each.value, "auto_deploy", null)
  access_log_settings    = lookup(each.value, "access_log_settings", null)
  client_certificate_id  = lookup(each.value, "client_certificate_id", null)
  default_route_settings = lookup(each.value, "default_route_settings", null)
  description            = lookup(each.value, "description", null)
  route_settings         = lookup(each.value, "route_settings", [])
  stage_variables        = lookup(each.value, "stage_variables", null)

  tags = lookup(each.value, "tags", null)

  depends_on = [module.route]
}

module "domain_name" {
  source = "../resources/domain_name"

  for_each = var.domain_names

  domain_name               = each.value.domain_name
  region                    = each.value.region != null ? each.value.region : try(var.api.region, null)
  domain_name_configuration = each.value.domain_name_configuration
  mutual_tls_authentication = lookup(each.value, "mutual_tls_authentication", null)
  routing_mode              = lookup(each.value, "routing_mode", null)
  timeouts                  = lookup(each.value, "timeouts", null)

  tags = lookup(each.value, "tags", null)
}

module "api_mapping" {
  source = "../resources/api_mapping"

  for_each = var.api_mappings

  api_id          = each.value.api_id != null ? each.value.api_id : module.api[0].id
  region          = each.value.region != null ? each.value.region : each.value.api_id == null ? try(var.api.region, null) : null
  domain_name     = each.value.domain_name != null ? each.value.domain_name : module.domain_name[each.value.domain_name_custom_name].id
  stage           = each.value.stage != null ? each.value.stage : module.stage[each.value.stage_custom_name].id
  api_mapping_key = lookup(each.value, "api_mapping_key", null)
}
