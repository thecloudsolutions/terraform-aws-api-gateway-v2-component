variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "content_type" {
  type        = string
  description = "(Required) The content-type for the model, for example, application/json. Must be between 1 and 256 characters in length."
}

variable "name" {
  type        = string
  description = "(Required) Name of the model. Must be alphanumeric. Must be between 1 and 128 characters in length."
}

variable "schema" {
  type        = string
  description = "(Required) Schema for the model. This should be a JSON schema draft 4 model. Must be less than or equal to 32768 characters in length."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the model. Must be between 1 and 128 characters in length."
}
