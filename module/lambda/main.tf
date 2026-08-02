resource "aws_lambda_function" "login_function" {
  filename      = data.archive_file.login.output_path
  function_name = var.login_function_name
  role          = var.login_role_arn
  handler       = "login.handler"
  runtime       = "python3.14"
}

resource "aws_lambda_function" "signup_function" {
  filename      = data.archive_file.signup.output_path
  function_name = var.signup_function_name
  role          = var.signup_role_arn
  handler       = "signup.handler"
  runtime       = "python3.14"
}

resource "aws_lambda_permission" "api_gateway_login" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.login_function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  # source_arn = "${aws_api_gateway_rest_api.mary-api.execution_arn}/*"
}

resource "aws_lambda_permission" "api_gateway_signup" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.signup_function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  # source_arn = "${aws_api_gateway_rest_api.mary-api.execution_arn}/*"
}
