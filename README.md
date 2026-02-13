# biglake-s3-bigquery-integration
This repository demonstrates how to query data stored in Amazon S3 directly from Google BigQuery using BigLake (BigQuery Omni) without migrating the data. The project simulates a production-like data analytics pipeline using dummy data, identity federation, external tables, and BI reporting use cases.

⚠️ Important Manual Steps (Real-World Limitation)

Some steps cannot be 100% Terraform-automated yet:

🔐 Identity Federation (Manual)

In AWS console:

Go to IAM → Identity Providers

Add OIDC provider for accounts.google.com

Link it to the IAM role created above

This is required for BigQuery Omni trust.

🔗 BigQuery Connection Activation (Manual)

In Google BigQuery Console:

BigQuery → Connections → AWS

Verify the connection

Attach the IAM Role ARN

Approve trust relationship
