module "k8s" {
    source = "./modules/k8s"
}

module "function" {
    source = "./modules/function"

    project_id = var.project_id
    zone       = var.zone
    region     = var.region
}