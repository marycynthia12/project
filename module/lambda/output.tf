output "login_function_arn" {
  value = aws_lambda_function.login_function.arn
}

output "signup_function_arn" {
  value = aws_lambda_function.signup_function.arn
}

# output "api_gateway_invoke_url" {
#   value = aws_api_gateway_rest_api.mary-api.execution_arn
# }

output "lambda_invoke_arn" {
  value = aws_lambda_function.login_function.invoke_arn
}

output "login_role_arn" {
  value = var.login_role_arn
}

output "signup_role_arn" {
  value = var.signup_role_arn
}