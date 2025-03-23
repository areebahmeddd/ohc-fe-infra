# Name of the GCS bucket to use as backend
variable "bucket_name" {
  description = "Name of the GCS bucket to use as backend"
  type        = string
}

# Name of the backend bucket resource (default is 'ohc-backend-bucket')
variable "backend_name" {
  description = "Name of the backend bucket resource"
  type        = string
  default     = "ohc-backend-bucket"
}

# Enable CDN for the backend bucket (default is true)
variable "enable_cdn" {
  description = "Whether to enable CDN for the backend bucket"
  type        = bool
  default     = true
}
