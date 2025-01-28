variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This is  AMI ID if ec2 instance of DevOps-practice "

}

variable "instance_type" {
    type = string
    default = "t3.micro"
    
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "Dev"
        Terraform = "true"
          
    }

}

variable "sg_name" {
    default = "allow_sshh"
}
variable "description" {
    default = "Allow port numbers 22 for ssh access"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_block" {
    type = list(string)
    default = ["::/0"]
}
