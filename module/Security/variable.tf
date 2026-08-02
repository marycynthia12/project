variable "rds_sg_name" {
  description = "The name of the security group to be created for the RDS instance."
}

variable "ec2_sg_name" {
  description = "The name of the security group to be created for the EC2 instance."
}

variable "alb_sg_name" {
  description = "The name of the security group to be created for the Application Load Balancer."
}

// Declare required variables
variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created."
}  