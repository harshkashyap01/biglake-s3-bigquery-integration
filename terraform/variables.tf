variable "aws_region" {
  default = "ap-south-1"
}

variable "gcp_project_id" {
  description = "Your GCP project ID"
}

variable "gcp_region" {
  default = "asia-south1"
}

variable "s3_bucket_name" {
  description = "Unique S3 bucket name"
}
