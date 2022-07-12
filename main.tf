
resource "argocd_repository" "private" {
  count  = var.repo_exists == "true" ? 0 : 1
  name            = var.argo_project
  repo            = var.git_repository
  type            = "git"
  username        = var.git_username
  password        = var.git_password
  insecure        = false
}



resource "argocd_project" "project" {
  metadata {
    name      = var.argo_project
    namespace = var.argo_server_namespace
    labels = {
      env = "prod"
      name = var.argo_project
    }
  }

  spec {
    description  = var.project_description
    source_repos = [var.git_repository]

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.destination_k8s_namespace
    }

    cluster_resource_whitelist {
      group = "*"
      kind = "*"
    }
  }

  /*depends_on = [
    argocd_repository.private,
  ]*/
}


resource "argocd_application" "helmfile" {
  metadata {
    name      = var.application_name
    namespace = var.argo_server_namespace
    labels = {
      test = "false"
    }
  }

  spec {
    project = var.argo_project

    source {
      repo_url        = var.git_repository
      path            = "helm"
      target_revision = var.git_branch

      plugin {
        name     = "helmfile"
      }
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.destination_k8s_namespace
    }

  }
  /*depends_on = [
     argocd_repository.private,
     argocd_project.project,
  ]*/
}

