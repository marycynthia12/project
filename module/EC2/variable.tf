variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the Application Load Balancer."
}

variable "target_group_arn" {
  type = string
}

variable "instance_profile_name" {
  type = string
}