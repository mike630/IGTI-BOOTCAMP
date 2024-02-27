variable "base_bucket_name" {
  default = "bucket-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "930367485749"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMR"
}

variable "airflow_subnet_id" {
  default = "subnet-034e6d4e"
}

variable "key_pair_name" {
  default = "igti-key-pair"
}

variable "vpc_id" {
  default = "vpc-7c11a614"
}