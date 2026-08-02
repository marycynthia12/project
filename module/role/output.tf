output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "lambda_role_name" {
  value = aws_iam_role.lambda_role.name
}

output "deployment_role_name" {
  value = aws_iam_role.deployment_role.name
}

output "ec2_role_name" {
  value = aws_iam_role.ec2_role.name
}