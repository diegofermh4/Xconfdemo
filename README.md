# xconf2020-pcs-infra-demo

Main declara los módulos que vamos a usar: `function` y `k8s`.
El módulo `function` se encarga de definir la configuración para desplegar una función (Cloud Function) en GCP. Mientras que el módulo `k8s` se encarga de levantar un cluster de kubernetes en Azure.

```bash
az ad sp create-for-rbac --skip-assignment
az aks get-credentials --resource-group $(terraform output module.k8s.resource_group_name) --name $(terraform output module.k8s.kubernetes_cluster_name
```