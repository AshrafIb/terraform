resource "azurerm_app_service_plan" "test" {
  name                = "${var.application_type}-${var.ressource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.ressource_group}"

  sku {
      tier="Free"
      size="F1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = "${var.location}"
  resource_group_name = "${var.ressource_group}"
  app_service_plan_id = azurerm_app_service_plan.test.id
}
