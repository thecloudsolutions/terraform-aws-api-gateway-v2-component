variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "domain_name" {
  type        = string
  description = "(Required) Domain name. Must be between 1 and 512 characters in length."
}

variable "domain_name_configuration" {
  type = object({
    certificate_arn = string
    # (Required) ARN of an AWS-managed certificate that will be used by the endpoint for the domain name. AWS Certificate Manager is the only supported source. Use the aws_acm_certificate resource to configure an ACM certificate.
    endpoint_type = string
    # (Required) Endpoint type. Valid values: REGIONAL.
    ip_address_type = optional(string)
    # (Optional) IP address type that can invoke the domain name. Valid values: ipv4, dualstack.
    ownership_verification_certificate_arn = optional(string)
    # (Optional) ARN of the AWS-issued certificate used to validate custom domain ownership (when certificate_arn is issued via an ACM Private CA or mutual_tls_authentication is configured with an ACM-imported certificate.)
    security_policy = string
    # (Required) Transport Layer Security (TLS) version of the security policy for the domain name. Valid values: TLS_1_2.
  })
  description = "(Required) Domain name configuration. "
}

variable "routing_mode" {
  type        = string
  default     = null
  description = "(Optional) Mode to route traffic for the domain name. Valid values: API_MAPPING_ONLY, ROUTING_RULE_ONLY, ROUTING_RULE_THEN_API_MAPPING."
}

variable "mutual_tls_authentication" {
  type = object({
    truststore_uri = string
    # (Required) Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example, s3://bucket-name/key-name. The truststore can contain certificates from public or private certificate authorities. To update the truststore, upload a new version to S3, and then update your custom domain name to use the new version.
    truststore_version = optional(string)
    # (Optional) Version of the S3 object that contains the truststore. To specify a version, you must have versioning enabled for the S3 bucket.
  })
  default     = null
  description = "(Optional) Mutual TLS authentication configuration for the domain name."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of tags to assign to the domain name. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # Default 10 minutes
    update = optional(string)
    # Default 60 minutes
  })
  default     = null
  description = "(Optional) Timeouts for the service."
}
