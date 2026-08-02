
resource "aws_iam_role_policy_attachment" "ec2_cw" {
  role       = var.ec2_role_name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ec2_s3" {
  role       = var.ec2_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.policy_profile
  role = var.ec2_role_name
}

resource "aws_iam_role_policy_attachment" "deployment" {
  role       = var.ec2_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}



