resource "aws_instance" "example" {
  ami           = "ami-06098fd00463352b6"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  user_data = <<EOF
    #! /bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF

  tags = {
    Env  = "dev"
    Name = "sg-test"
  }
}

output "example_public_dns" {
  value = aws_instance.example.public_dns
}