
resource "aws_launch_template" "shopnaija" {
  name_prefix   = "shopnaija_ec2_"
  image_id      = "ami-02b64aa047cb5edf5"
  instance_type = "t3.micro"

  iam_instance_profile {
    name = var.instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = true
  }
  #   user_data = filebase64("${path.module}/ec2_user_data.sh")
}

resource "aws_autoscaling_group" "shopnaija" {
  desired_capacity    = 2
  max_size            = 10
  min_size            = 2
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.shopnaija.id
    version = "$Latest"
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.shopnaija.id
  lb_target_group_arn    = var.target_group_arn
}