# OHC Test Infrastructure

This repository contains Terraform configurations for the OHC test static website infrastructure on Google Cloud Platform.

## Structure

- `environments/`: Environment-specific configurations
- `modules/`: Reusable Terraform modules
- `scripts/`: Helper scripts for deployment and maintenance

## Usage

To deploy to the dev environment:

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

To destroy all infrastructure:

```bash
cd environments/dev
terraform destroy
```
