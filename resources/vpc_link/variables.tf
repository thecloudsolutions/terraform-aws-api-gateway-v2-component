variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "name" {
  type        = string
  description = "(Required) Name of the VPC Link. Must be between 1 and 128 characters in length."
}

variable "security_group_ids" {
  type        = set(string)
  description = "(Required) Security group IDs for the VPC Link."
}

variable "subnet_ids" {
  type        = set(string)
  description = "(Required) Subnet IDs for the VPC Link."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of tags to assign to the VPC Link. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
