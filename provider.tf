terraform {
  required_version = ">= 0.13.1"

  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "3.0.0"
    }
  }
}

provider "argocd" {
  server_addr = var.argo_server
  auth_token = var.argo_server_token
  grpc_web = true
}