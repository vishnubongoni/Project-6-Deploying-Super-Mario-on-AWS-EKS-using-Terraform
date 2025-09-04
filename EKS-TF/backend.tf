terraform {
  backend "s3" {
    bucket  = "sample-mario-bucket-ver0.0.11"          # Replace with your actual S3 bucket
    key     = "eks/terraform.tfstate"  # Path within the bucket
    region  = "us-east-1"
    encrypt = true                     # Ensures state file is encrypted
  }
}

