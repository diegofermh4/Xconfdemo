module "k8s" {
    source = "./modules/k8s"
}

module "function" {
    source = "./modules/function"
}