module "app_service" {
    source          ="../../modules/appservice"
    location        ="${var.location}"
    ressource_type  =""

}