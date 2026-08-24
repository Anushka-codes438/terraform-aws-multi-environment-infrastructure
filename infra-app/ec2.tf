 # Key pair login

resource "aws_key_pair" "my-key-pair"{
    key_name = "${var.env}-my-infra-key"
    public_key = file("${path.module}/terraform-ec2.pub")

    tags = {
        Environment = var.env
    }
}

  
# Security group

resource "aws_security_group" "my-sg"{
    name = "${var.env}-my-infra-sg"
    description = "sg inbound traffic and all outbound traffic"
    vpc_id = module.vpc.vpc_id

# inbound rule

ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"

}
ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}

# outbound rule

egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    description = "All outbound traffic"

}
tags= {
Name = "${var.env}-my-infra-sg"
}

}

resource "aws_instance" "my-instance"{
    count = var.instance_count
    key_name = aws_key_pair.my-key-pair.key_name
    ami =  var.aws_ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.private_subnets[0]
    vpc_security_group_ids = [aws_security_group.my-sg.id]
    




root_block_device{
    volume_type = "gp3"
    volume_size = var.env == "prd" ?20 :10
    tags={
        name = "tws-server"
    }
     
    }
   tags = {
         
        Name =  "${var.env}-my-infra-instance"
        Environment = var.env
    }
 

}
 
 

 