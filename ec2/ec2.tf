resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  subnet_id   = "subnet-027e9b95abbffe496"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all-roboshop-sg"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    lifecycle {
      create_before_destroy = true
    }

    tags = {
        Name = "allow-all-roboshop"
    }
}