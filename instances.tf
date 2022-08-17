resource "aws_instance" "elb_instance_1" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  availability_zone       = "us-east-1a"

  vpc_security_group_ids = [aws_security_group.challenge.id]

  user_data = <<-EOF
	        #!/bin/bash
		    sudo yum update -y
		    sudo yum -y install httpd -y
		    sudo service httpd start 
		    echo "Hello world Server1 from EC2 $(hostname -f)" > /var/www/html/index.html
		    EOF

  tags = {
    Name = "EC2-Instance-1"
  }
}

resource "aws_instance" "elb_instance_2" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_2.id
  availability_zone       = "us-east-1b"

  vpc_security_group_ids = [aws_security_group.challenge.id]

  user_data = <<-EOF
	        #!/bin/bash
		    sudo yum update -y
		    sudo yum -y install httpd -y
		    sudo service httpd start 
		    echo "Hello world Server2 from EC2 $(hostname -f)" > /var/www/html/index.html
		    EOF

  tags = {
    Name = "EC2-Instance-2"
  }
}