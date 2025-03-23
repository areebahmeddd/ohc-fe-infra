# Google Cloud project ID
variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

# Google Cloud region
variable "region" {
  description = "Google Cloud region"
  type        = string
}

# Name of the GCS bucket
variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

# Domain name for the SSL certificate
variable "domain_name" {
  description = "Domain name for the SSL certificate"
  type        = string
}

# Static IP address for the load balancer (optional)
variable "ip_address" {
  description = "Static IP address for the load balancer"
  type        = string
  default     = null
}

# Location of the GCS bucket (default is 'asia-south1')
variable "location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "asia-south1"
}
