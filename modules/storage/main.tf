# Create a GCS bucket for the static site
resource "google_storage_bucket" "static_site" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy
  
  uniform_bucket_level_access = true  # Enable uniform bucket-level access
}

# Grant public read access to the storage bucket
resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.static_site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"  # Allow public access (all users)
}
