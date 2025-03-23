# # Configure Terraform backend to use Google Cloud Storage (GCS)
# terraform {
#   backend "gcs" {
#     bucket = "ohc-terraform-state"    # GCS bucket to store the Terraform state
#     prefix = "terraform/state/dev"    # Prefix for the state file path within the bucket
#   }
# }
