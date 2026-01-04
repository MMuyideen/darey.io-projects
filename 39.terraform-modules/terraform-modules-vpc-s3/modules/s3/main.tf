resource "random_id" "suffix" {
  byte_length = 4
  keepers = {
    bucket_name = var.bucket_name
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name != "" ? var.bucket_name : "tf-modules-s3-${random_id.suffix.hex}"

}