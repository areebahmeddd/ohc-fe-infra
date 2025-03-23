# Name of the GCS bucket
variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

# Location of the GCS bucket (default is 'asia-south1')
variable "location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "asia-south1"
}

# Force deletion of all objects when deleting the bucket
variable "force_destroy" {
  description = "When deleting a bucket, delete all objects in the bucket"
  type        = bool
  default     = true
}
