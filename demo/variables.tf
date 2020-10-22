variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "project_id" {
  type = string
}

# ======================
# Azure
# ======================
variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}