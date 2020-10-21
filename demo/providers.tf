provider "google" {
    version = "~> 3.43.0"
    region      = var.region
    project     = var.project_id
    credentials = file("gcloud-service-key.json")
    zone        = var.zone
}

provider "google-beta" {
    version = "~> 3.43.0"
    region      = var.region
    project     = var.project_id
    credentials = file("gcloud-service-key.json")
    zone        = var.zone
}