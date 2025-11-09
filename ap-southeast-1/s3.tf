data "aws_canonical_user_id" "current" {}

# Bucket static_assets_dummy_1
resource "aws_s3_bucket" "static_assets_dummy_1" {
  bucket_prefix = "static-assets-dummy-1-"
  tags = {
      Env = "staging"
      }
}

output "bucket_name_dummy_1" {
  value = aws_s3_bucket.static_assets_dummy_1.bucket
}

resource "aws_s3_bucket_ownership_controls" "static_assets_dummy_1" {
  bucket = aws_s3_bucket.static_assets_dummy_1.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "static_assets_dummy_1" {
  bucket = aws_s3_bucket.static_assets_dummy_1.id

  access_control_policy {
    grant {
      grantee {
        type = "CanonicalUser"
        id   = data.aws_canonical_user_id.current.id
      }
      permission = "FULL_CONTROL"
    }

    grant {
      grantee {
        type = "CanonicalUser"
        id   = "7433980e0c05be5f1d20c5aa1ed3e9e0c1c497a8f4749bd7f37596e61bc757a7" # Dummy
      }
      permission = "READ"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }

  depends_on = [
    aws_s3_bucket_ownership_controls.static_assets_dummy_1
  ]
}

# Bucket static_assets_dummy_2
resource "aws_s3_bucket" "static_assets_dummy_2" {
  bucket_prefix = "static-assets-dummy-2-"
  tags = {
      Env = "staging"
      }
}

output "bucket_name_dummy_2" {
  value = aws_s3_bucket.static_assets_dummy_2.bucket
}

resource "aws_s3_bucket_ownership_controls" "static_assets_dummy_2" {
  bucket = aws_s3_bucket.static_assets_dummy_2.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "static_assets_dummy_2" {
  bucket = aws_s3_bucket.static_assets_dummy_2.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "static_assets_dummy_2" {
  bucket = aws_s3_bucket.static_assets_dummy_2.id
  acl    = "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.static_assets_dummy_2,
    aws_s3_bucket_public_access_block.static_assets_dummy_2
  ]
}