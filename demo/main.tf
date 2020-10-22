module "k8s" {
    source = "./modules/k8s"

    appId    = var.appId
    password = var.password
}

module "function" {
    source = "./modules/function"

    project_id = var.project_id
    zone       = var.zone
    region     = var.region
}