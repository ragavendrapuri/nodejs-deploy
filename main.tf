resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "sg1" {
  ingress {
    description = "ssh access"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http access"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https access"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "jenkins_host" {
  ami             = var.ami # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type   = "t2.micro"
  key_name        = "new1" # Replace with your key pair name
  security_groups = [aws_security_group.sg1.name]
  tags = {
    Name = "JenkinsHost"
  }

}