# -------------------------------
# SECURITY GROUP FOR EC2 + ALB
# -------------------------------
# This acts like a firewall.
# It controls what traffic can enter/leave your EC2 and ALB.

resource "aws_security_group" "api_sg" {
  name        = "api-security-group"
  description = "Allow SSH, HTTP, and app traffic"
  vpc_id      = aws_vpc.main_vpc.id

  # Allow SSH access from YOUR IP only (secure)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["105.112.34.78/32"]
  }

  # Allow HTTP traffic (used by ALB)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow app traffic (Node.js runs on port 3000)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (needed for updates, npm install, etc.)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------------
# FETCH LATEST AMAZON LINUX AMI
# -------------------------------
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# -------------------------------
# EC2 INSTANCE (YOUR SERVER)
# -------------------------------
# This is where your Node.js app will run

resource "aws_instance" "api_server" {
  ami = data.aws_ami.amazon_linux.id # Amazon Linux AMI (us-east-1)
  instance_type = "t2.micro"              # Free tier eligible

  # Place EC2 inside your public subnet
  subnet_id = aws_subnet.public_subnet.id

  # Attach the security group (firewall rules)
  vpc_security_group_ids = [aws_security_group.api_sg.id]

  # SSH key to access the server
  key_name = "project-infra-api-key-pair"

  tags = {
    Name = "project-infra-api"
  }
}