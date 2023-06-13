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

variable "site_config" {
  type = object({
    always_on                = optional(bool, false)
    dotnet_framework_version = string
    ftps_state               = optional(string, "FtpsOnly")
    cors = object({
      allowed_origins = list(string)
    })
  })
  default = {
    always_on                = false
    ftps_state               = "FtpsOnly"
    dotnet_framework_version = "v7.0"
    cors = {
      allowed_origins = ["*"]
    }
  }
}
