#!/bin/bash
# Usage: bash upload_files.sh <bucket_name> <build_dir>

set -e

# Check if correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <bucket_name> <build_dir>"
    exit 1
fi

BUCKET_NAME=$1
BUILD_DIR=$2

# Check if build directory exists
if [ ! -d "$BUILD_DIR" ]; then
    echo "Error: Build directory $BUILD_DIR does not exist"
    exit 1
fi

# Upload files to the GCS bucket
echo "Uploading files from $BUILD_DIR to gs://$BUCKET_NAME/"
gsutil -m cp -r "$BUILD_DIR"/* "gs://$BUCKET_NAME/"

# Set cache control headers for various file types
echo "Setting cache control headers"

# Service worker and source maps (no cache)
gsutil -m setmeta -h "Cache-Control:no-cache, no-store, must-revalidate" "gs://$BUCKET_NAME/service-worker.js" "gs://$BUCKET_NAME/*.js.map"

# HTML and robots.txt (1 hour cache)
gsutil -m setmeta -h "Cache-Control:public, max-age=3600" "gs://$BUCKET_NAME/index.html" "gs://$BUCKET_NAME/robots.txt"

# Manifests and favicon (24 hours cache)
gsutil -m setmeta -h "Cache-Control:public, max-age=86400" "gs://$BUCKET_NAME/manifest.webmanifest" "gs://$BUCKET_NAME/manifest.json" "gs://$BUCKET_NAME/favicon.ico"

# Static assets (1 year cache)
gsutil -m setmeta -h "Cache-Control:public, max-age=31536000" "gs://$BUCKET_NAME/static/*" "gs://$BUCKET_NAME/assets/*" "gs://$BUCKET_NAME/*.js" "gs://$BUCKET_NAME/*.css" "gs://$BUCKET_NAME/*.png" "gs://$BUCKET_NAME/*.svg" "gs://$BUCKET_NAME/*.jpg"

echo "Upload complete!"
