resource "aws_iam_role" "bigquery_omni_role" {
  name = "bigquery-omni-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "accounts.google.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "bigquery-omni-s3-read"
  description = "Allow BigQuery Omni to read S3 data"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.biglake_bucket.arn,
          "${aws_s3_bucket.biglake_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.bigquery_omni_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
