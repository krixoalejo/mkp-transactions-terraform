# Habilitar API de Artifact Registry
resource "google_project_service" "artifact_registry_api" {
  project            = var.project_id
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = true
}

# Crear repositorio Docker
resource "google_artifact_registry_repository" "docker_repo" {
  depends_on = [google_project_service.artifact_registry_api]

  location      = var.region
  repository_id = var.repository_id
  format        = "DOCKER"
  description   = "Repositorio para imágenes Docker"
}
