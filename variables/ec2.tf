resource "aws_security_group" "allow_ssh" {
  Name        = var.sg_name
  description = var.description

#egress block
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port #value saved in variable
        to_port          = var.to_port
        protocol         = var.protocol   # allows all protocals
        cidr_blocks      = var.cidr_blocks #allowed from every one
        ipv6_cidr_blocks = var.ipv6_cidr_block
    }

    tags = var.tags

    
    
}

resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids= [aws_security_group.allow_ssh.id]

     tags = var.tags
}