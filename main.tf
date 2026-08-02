module "ALB" {
  source     = "./module/ALB"
  alb_name   = "shopnaija-alb"
  subnet_ids = module.Networking.public_subnet_ids
  tg_name    = "shopnaija-tg"
  vpc_id     = module.Networking.vpc_id
  alb_sg_ids = [module.security.alb_sg_id]
}

module "api" {
  source        = "./module/api"
  stage_name    = "prod"
  resource_path = "mary1"
  http_method   = "POST"
  api_name      = "mary-api"
}

module "cloudfront" {
  source       = "./module/cloudfront"
  alb_dns_name = module.ALB.alb_dns_name
}

module "cloudwatch" {
  source = "./module/cloudwatch"
}

module "EC2" {
  source                = "./module/EC2"
  subnet_ids            = module.Networking.public_subnet_ids
  target_group_arn      = module.ALB.target_group_arn
  instance_profile_name = module.policy.ec2_instance_profile
}

module "lambda" {
  source               = "./module/lambda"
  login_function_name  = "login-function"
  signup_function_name = "signup-function"
  login_role_arn       = module.role.lambda_role_arn
  signup_role_arn      = module.role.lambda_role_arn
}

module "Networking" {
  source = "./module/Networking"
}

module "policy" {
  source        = "./module/policy"
  ec2_role_name = module.role.ec2_role_name
}

module "RDS" {
  source             = "./module/RDS"
  db_password        = "your-db-password"
  db_name            = "mydb031"
  db_username        = "mydbuser9ma"
  private_subnet_ids = module.Networking.private_subnet_ids
}

module "role" {
  source = "./module/role"
}

module "s3" {
  source     = "./module/s3"
  lambda_arn = module.lambda.login_function_arn
}

module "security" {
  source      = "./module/Security"
  vpc_id      = module.Networking.vpc_id
  ec2_sg_name = "ec2-sg"
  rds_sg_name = "rds-sg"
  alb_sg_name = "alb-sg"
}
