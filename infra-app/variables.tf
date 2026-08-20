variable "env"{
    description = "Environment name"
    type = string

}

variable "bucket_name"{
    description = "S3 bucket name"
    type = string
}
variable "instance_count"{
    description = "Number of EC2 instances to create"
    type = number
}
variable "instance_type"{
    description = "Type of EC2 instance to create"
    type = string
}

variable "aws_ami_id"{
    description = "AMI ID to use for EC2 instance"
    type = string
}

variable "hash_key"{
    description = "Hash key for DynamoDB table"
    type = string
}