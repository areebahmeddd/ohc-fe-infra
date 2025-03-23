# Output the name of the storage bucket
output "bucket_name" {
  description = "The name of the storage bucket"
  value       = google_storage_bucket.static_site.name
}

# Output the URL of the storage bucket
output "bucket_url" {
  description = "The URL of the storage bucket"
  value       = google_storage_bucket.static_site.url
}
