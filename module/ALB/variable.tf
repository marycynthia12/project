variable "alb_name" {
  description = "The name of the Application Load Balancer."
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the Application Load Balancer."

}

variable "tg_name" {
  description = "The name of the target group for the Application Load Balancer."
}

variable "vpc_id" {
  description = "The ID of the VPC where the Application Load Balancer will be created."
}

variable "alb_sg_ids" {
  description = "A list of security group IDs to associate with the Application Load Balancer."
}