resource "aws_security_group" "allow_ssh" {
  name        = "allow_sshh"
  description = "Allow ssh"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp" # allows all protocals
        cidr_blocks      = ["0.0.0.0/0"] #allowed from every one
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        name = "allow_sshh"
    }

    
    
}

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_ssh.id]

    tags = {
        Name = "terraform"
    }
}