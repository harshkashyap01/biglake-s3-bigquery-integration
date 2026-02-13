resource "google_bigquery_dataset" "analytics" {
  dataset_id = "federated_analytics"
  location   = "US"

  labels = {
    env = "demo"
  }
}

# BigQuery Connection (AWS)
resource "google_bigquery_connection" "aws_connection" {
  connection_id = "aws_s3_connection"
  location      = "US"

  aws {
    access_role {
      iam_role_id = aws_iam_role.bigquery_omni_role.arn
    }
  }
}
