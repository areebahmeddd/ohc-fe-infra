# Google Cloud provider configuration
provider "google" {
  project = var.project_id  # Google Cloud project ID
  region  = var.region      # Google Cloud region
}

# Module to create a storage bucket
module "storage" {
  source = "../../modules/storage"
  
  bucket_name   = var.bucket_name    # Name of the GCS bucket
  location      = var.location       # Location of the GCS bucket
  force_destroy = true               # Force delete all objects when bucket is destroyed
}

# Module to configure CDN for the storage bucket
module "cdn" {
  source = "../../modules/cdn"
  
  bucket_name = module.storage.bucket_name  # Bucket name from storage module
}

# Module to configure the load balancer
module "load_balancer" {
  source = "../../modules/load-balancer"
  
  backend_self_link = module.cdn.backend_self_link  # Backend self-link from CDN module
  domain_name       = var.domain_name              # Domain name for the load balancer
  ip_address        = var.ip_address               # Static IP address for the load balancer
}

# Output the website URL based on the domain name
output "website_url" {
  description = "Website URL"
  value       = "https://${var.domain_name}"
}

# Output the storage bucket name
output "bucket_name" {
  description = "Storage bucket name"
  value       = module.storage.bucket_name
}

# Output the IP address of the load balancer
output "load_balancer_ip" {
  description = "Load balancer IP address"
  value       = module.load_balancer.ip_address
}
