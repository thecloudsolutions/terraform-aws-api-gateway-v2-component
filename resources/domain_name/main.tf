resource "aws_apigatewayv2_domain_name" "this" {
  domain_name  = var.domain_name
  region       = var.region
  routing_mode = var.routing_mode

  domain_name_configuration {
    certificate_arn                        = var.domain_name_configuration.certificate_arn
    endpoint_type                          = var.domain_name_configuration.endpoint_type
    ip_address_type                        = lookup(var.domain_name_configuration, "ip_address_type", null)
    security_policy                        = var.domain_name_configuration.security_policy
    ownership_verification_certificate_arn = lookup(var.domain_name_configuration, "ownership_verification_certificate_arn", null)
  }

  dynamic "mutual_tls_authentication" {
    for_each = var.mutual_tls_authentication != null ? [var.mutual_tls_authentication] : []
    content {
      truststore_uri     = mutual_tls_authentication.value.truststore_uri
      truststore_version = lookup(mutual_tls_authentication.value, "truststore_version", null)
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  tags = var.tags
}
