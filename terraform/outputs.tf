output "s3_bucket_name" {
  value = aws_s3_bucket.biglake_bucket.bucket
}

output "aws_iam_role_arn" {
  value = aws_iam_role.bigquery_omni_role.arn
}

output "bigquery_dataset" {
  value = google_bigquery_dataset.analytics.dataset_id
}
