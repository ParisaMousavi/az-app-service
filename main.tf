resource "azurerm_app_service" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}

resource "azurerm_app_service_custom_hostname_binding" "this" {
  count               = var.custom_domain.enabled == true ? 1 : 0
  hostname            = var.custom_domain.hostname
  app_service_name    = azurerm_app_service.this.name
  resource_group_name = var.resource_group_name
  ssl_state           = var.custom_domain.ssl_state
}
