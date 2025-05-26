# cloudrun.tf

# Habilitar API de Cloud Run
resource "google_project_service" "cloud_run_api" {
  service            = "run.googleapis.com"
  disable_on_destroy = true
}

# Crear servicio de Cloud Run
resource "google_cloud_run_v2_service" "transactions_ms_service" {
  depends_on = [google_project_service.cloud_run_api]

  name                = "transactions-ms-service"
  location            = var.region
  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false

  template {
    containers {
      # Referencia a la imagen en Artifact Registry
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}/${var.image_name}:${var.image_tag}"

      # Configuración de recursos
      resources {
        cpu_idle = true
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }
  }
}

# Permitir acceso público al servicio
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  location = google_cloud_run_v2_service.transactions_ms_service.location
  name     = google_cloud_run_v2_service.transactions_ms_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
