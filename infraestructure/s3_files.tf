resource "aws_s3_object" "codigo_spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-pyspark-code/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}

resource "aws_s3_object" "delta_insert" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-pyspark-code/01_delta_spark_insert.py"
  acl    = "private"
  source = "../01_delta_spark_insert.py"
  etag   = filemd5("../01_delta_spark_insert.py")
}

resource "aws_s3_object" "delta_upsert" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-pyspark-code/02_delta_spark_upsert.py"
  acl    = "private"
  source = "../02_delta_spark_upsert.py"
  etag   = filemd5("../02_delta_spark_upsert.py")
}