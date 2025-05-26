# variables.tf
variable "project_id" {
  description = "project_id"
  type        = string
  default     = "logical-grammar-438423-b8"
}

variable "region" {
  description = "region"
  type        = string
  default     = "us-central1"
}

variable "repository_id" {
  description = "repository_id"
  type        = string
  default     = "mkp-transactions-ms"
}

variable "image_name" {
  description = "image_name"
  type        = string
  default     = "mkp-transactions-image"
}

variable "image_tag" {
  description = "Tag de la imagen Docker"
  type        = string
}
