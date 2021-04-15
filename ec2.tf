#EC2作成
resource "aws_instance" "ec2" {
  ami                         = "ami-01ea829736362a698"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.sample.id
}
