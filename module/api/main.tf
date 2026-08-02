resource "aws_api_gateway_rest_api" "mary-api" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "proxy" {
  parent_id   = aws_api_gateway_rest_api.mary-api.root_resource_id
  path_part   = var.resource_path
  rest_api_id = aws_api_gateway_rest_api.mary-api.id
}

resource "aws_api_gateway_method" "post" {
  authorization = "NONE"
  http_method   = var.http_method
  resource_id   = aws_api_gateway_resource.proxy.id
  rest_api_id   = aws_api_gateway_rest_api.mary-api.id
}

resource "aws_api_gateway_integration" "lambda" {
  http_method = aws_api_gateway_method.post.http_method
  resource_id = aws_api_gateway_resource.proxy.id
  rest_api_id = aws_api_gateway_rest_api.mary-api.id
  type        = "MOCK"
}

resource "aws_api_gateway_deployment" "deploy" {
  rest_api_id = aws_api_gateway_rest_api.mary-api.id

  depends_on = [
    aws_api_gateway_method.post,
    aws_api_gateway_integration.lambda
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.deploy.id
  rest_api_id   = aws_api_gateway_rest_api.mary-api.id
  stage_name    = var.stage_name
}