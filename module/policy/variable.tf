variable "policy_profile" {
  description = "The name of the IAM instance profile to be created for the EC2 instance."
  default     = "ec2_profile"
}

variable "ec2_role_name" {
  type = string
}