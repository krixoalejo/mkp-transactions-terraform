# outputs.tf
# output "repository_url" {
#   value = google_artifact_registry_repository.docker_repo.name
# }

# Outputs
output "service_url" {
  value = google_cloud_run_v2_service.transactions_ms_service.uri
}
