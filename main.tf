provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "tf_test" {
    name     =  "tf_training"
    location =  "westeurope"
}

resource "azurerm_container_group" "tf_container_test" {
    name                   = "apiweather"
    location               = azurerm_resource_group.tf_test.location
    resource_group_name    = azurerm_resource_group.tf_test.name
    
    ip_address_type          = "Public"
    dns_name_label          =  "binaryweatheribrahiasweather"
    os_type                 =  "Linux"

   container {
       name             = "apiweather"
       image            = "binaryibrahiastest/weatherapi"
       cpu              = "1"
       memory           = "1"

       ports {

           port         = 80
           protocol     = "TCP"
       }
       }
   } 