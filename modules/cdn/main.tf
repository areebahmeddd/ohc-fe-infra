# Create a backend bucket with optional CDN enabled
resource "google_compute_backend_bucket" "backend" {
  name        = var.backend_name
  bucket_name = var.bucket_name
  enable_cdn  = var.enable_cdn
}
