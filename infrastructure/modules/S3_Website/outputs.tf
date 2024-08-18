output "bucket_name" {
  value = aws_s3_bucket.main.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.main.website_endpoint
}
