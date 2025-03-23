# OHC Test Infrastructure

This repository contains Terraform configurations for the OHC test static website infrastructure on Google Cloud Platform (GCP).

## Structure

```
- environments/         # Environment-specific configurations
  - dev/                # Development environment configuration
- modules/              # Reusable Terraform modules
  - cdn/                # CDN configuration for the static website
  - load-balancer/      # HTTP/HTTPS load balancer setup with SSL
  - storage/            # GCS bucket configuration for static file hosting
- scripts/              # Helper scripts for deployment and maintenance
```

## Usage

### Configuration

Before deploying, customize the configuration by editing the `environments/dev/terraform.tfvars` file:

```
# Google Cloud project ID
project_id  = "your-gcp-project-id"

# Google Cloud region
region      = "your-gcp-region"

# Name of the GCS bucket
bucket_name = "your-bucket-name"

# Domain name for the SSL certificate
domain_name = "your-domain.com"

# Static IP address for the load balancer (optional)
ip_address  = null

# Location of the GCS bucket
location    = "your-gcp-region"
```

---

## Infrastructure Deployment

To deploy the infrastructure to the development environment, run:

```sh
terraform init
terraform plan
terraform apply
```

To destroy all infrastructure:

```sh
terraform destroy
```

---

## Uploading Website Files

After deploying the infrastructure, you can upload your static website files using the provided script.

### Uploading Files to GCS

Run the script to upload files from the `build` directory to the GCS bucket:

```sh
./scripts/upload_files.sh
```

### Cache Control Settings

- **No cache** for service worker and source maps
- **1 hour cache** for HTML and `robots.txt`
- **24 hours cache** for manifests and favicon
- **1 year cache** for static assets (JS, CSS, images)
