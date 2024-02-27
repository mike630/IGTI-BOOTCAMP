resource "aws_s3_bucket" "dl" {
  bucket = "${var.ambiente}-${var.base_bucket_name}"

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.dl.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.dl.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]
  bucket     = aws_s3_bucket.dl.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.dl.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_athena_workgroup" "athena_workgroup" {
  name = "aws_athena_query_result_location"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.dl.bucket}/athena_query_output/"

      encryption_configuration {
        encryption_option = "SSE_S3"
      }
    }
  }
}