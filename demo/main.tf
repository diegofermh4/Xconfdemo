module "k8s" {
    source = "./modules/k8s"

    appId    = var.appId
    password = var.password
}