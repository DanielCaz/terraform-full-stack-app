output "bucket_name" {
  value = aws_s3_bucket.main.bucket

  description = "The name of the S3 bucket where the pipeline artifacts are stored."
}
