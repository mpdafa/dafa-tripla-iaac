resource "aws_s3_bucket" "static_assets_s3_dummy_northeast" {
  bucket_prefix = "static-assets-s3-northeast-1-"
  tags = {
      Env = "staging"
      }
  }

output "bucket_name" {
  value = aws_s3_bucket.static_assets_s3_dummy_northeast.bucket
}