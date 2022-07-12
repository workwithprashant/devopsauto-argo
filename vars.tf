variable "argo_server" {
	type = string
}

variable "argo_server_token" {
	type = string
}

variable "argo_server_namespace" {
	type = string
}

variable "git_username" {
	type = string
	default = "default"
}

variable "git_password" {
	type = string
}

variable "git_repository" {
	type = string
}

variable "git_branch" {
	type = string
}

/*variable "repo_exists" {
	type = string
	default = ""
}*/

variable "argo_project" {
	type = string
}

variable "destination_k8s_namespace" {
	type = string
}

variable "project_description" {
	type = string
}

variable "application_name" {
	type = string
}

variable "app_helmfile_env_name" {
	type = string
}

variable "app_helmfile_env_project" {
	type = string
}