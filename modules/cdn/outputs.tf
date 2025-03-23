# Output the name of the backend bucket
output "backend_bucket_name" {
  description = "The name of the backend bucket"
  value       = google_compute_backend_bucket.backend.name
}

# Output the self link of the backend bucket
output "backend_self_link" {
  description = "The self link of the backend bucket"
  value       = google_compute_backend_bucket.backend.self_link
}
