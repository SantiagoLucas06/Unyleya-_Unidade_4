variable "resource_group_name" {
  description = "Nome do Resource Group no Azure"
  type        = string
  default     = "unyleya-projeto-rg"
}

variable "location" {
  description = "Região do Azure"
  type        = string
  default     = "Brazil South"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "unyleya"
}

variable "environment" {
  description = "Ambiente (dev, homol, prod)"
  type        = string
  default     = "dev"
}

variable "docker_hub_username" {
  description = "Usuário do Docker Hub"
  type        = string
  sensitive   = true
}

variable "docker_image_name" {
  description = "Nome da imagem no Docker Hub"
  type        = string
  default     = "unyleya-app"
}

variable "docker_image_tag" {
  description = "Tag da imagem Docker"
  type        = string
  default     = "latest"
}
