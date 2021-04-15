#S3作成
resource "aws_s3_bucket" "bucket" {
  #バケット名は世界で唯一である必要があります
  bucket = "terraform-sample-backet"
  acl    = "public-read"

  tags = {
    Nmae        = "purchase-app-backet"
    Environment = "Production"
  }
}
