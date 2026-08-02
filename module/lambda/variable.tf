
variable "login_function_name" {
  description = "The name of the login Lambda function to be invoked by the API Gateway"
}

variable "signup_function_name" {
  description = "The name of the signup Lambda function to be invoked by the API Gateway"
}


variable "signup_role_arn" {
  description = "The ARN of the IAM role to be assumed by the signup Lambda function"
}

variable "login_role_arn" {
  description = "The ARN of the IAM role to be assumed by the login Lambda function"
}