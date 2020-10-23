module "k8s" {
    source = "./modules/k8s"

    appId    = var.appId
    password = var.password
}

module "function" {
    source     = "./modules/function"
    depends_on = [module.k8s]

    project_id   = var.project_id
    zone         = var.zone
    region       = var.region
    cluster_name = module.k8s.kubernetes_cluster_name
}