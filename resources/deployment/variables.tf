variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description for the deployment resource. Must be less than or equal to 1024 characters in length."
}

variable "triggers" {
  type        = map(string)
  default     = null
  description = "(Optional) Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the terraform taint command."
}
