variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_service_plan_id" {
  type = string
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}

variable "custom_domain" {
  type = object({
    enabled   = optional(string, false)
    ssl_state = optional(string, null)
    hostname  = optional(string, null)
  })
}

