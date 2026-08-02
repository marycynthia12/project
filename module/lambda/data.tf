# Package the Lambda function code
data "archive_file" "login" {
  type        = "zip"
  source_file = "${path.module}/code/login.py"
  output_path = "${path.module}/login.zip"
}

# Package the Lambda function code
data "archive_file" "signup" {
  type        = "zip"
  source_file = "${path.module}/code/signup.py"
  output_path = "${path.module}/signup.zip"
}