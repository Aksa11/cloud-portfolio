terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}


data "aws_vpc" "selected" {
  id = var.target_vpc_id
}

resource "aws_subnet" "demo_subnet" {
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = "10.0.1.0/24"
  tags       = { Name = "Terraform-Subnet" }
}
#The Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = data.aws_vpc.selected.id
  tags   = { Name = "Main-IGW" }
}

#2. The Route Table (The map telling traffic where to go)
resource "aws_route_table" "rt" {
  vpc_id = data.aws_vpc.selected.id

  route {
    cidr_block = "0.0.0.0/0" # This means "All traffic"
    gateway_id = aws_internet_gateway.gw.id
  }
}

#3. The Connection (Lining up the Subnet with the Map)
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.demo_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "my_firewall" {
  name        = "allow_web"
  description = "Allow incoming traffic"
  vpc_id      = data.aws_vpc.selected.id

  # This is the "Inbound" rule (Incoming)
  ingress {
    from_port   = 22         # Port 22 is for SSH (Admin)
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["92.40.63.113/32"] # This lets me to connect (use carefully!)
  }

  ingress {
    from_port   = 80         # Port 80 is for Web browsing (HTTP)
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # This is the "Outbound" rule (The server talking to the world)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"       # "-1" means ALL protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "MyServer" {
  ami = "ami-0ba0c1a358147d1a8"
  instance_type = var.machine_size
  subnet_id     = aws_subnet.demo_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my_firewall.id]

tags = {
    Name = "SampleServer"
}
}
