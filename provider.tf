terraform {
  required_version = ">= 0.13.1"

  backend "s3" {
    bucket = "devops-auto-toolsg"
    key    = var.state_key
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
  }

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