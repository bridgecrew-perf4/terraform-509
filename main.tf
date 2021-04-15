# variable "変数名" {} で変数を定義します
# 定義した変数は.varvarsファイルから参照可能です
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "aws_db_username" {}
variable "aws_db_password" {}

# providerはAWSで設定
provider "aws" {
  # 認証キーとリージョンもここで設定しておかないと、コマンドを実行するごとに入力しなければいけないので面倒
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "ap-northeast-1"
}

#EC2インスタンスとの通信に必要なキーペアです。
resource "aws_key_pair" "sample" {
  key_name   = "sample"
  public_key = file("./sample.pub")
}

# outputを設定しておくことで、環境作成後に特定の変数を表示させます
output "public_ip" {
  value = aws_instance.ec2.public_ip
}
# 今回は作成したインスタンスのElasticIPを表示
