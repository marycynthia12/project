# EC2 CPU Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "EC2_CPU" {
  alarm_name                = var.ec2_cpu_name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}

# EC2 Instance health Alarm
resource "aws_cloudwatch_metric_alarm" "ec2_instance_health" {
  alarm_name                = var.ec2_health_name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 8
  alarm_description         = "This metric monitors ec2 instance health"
  insufficient_data_actions = []
}

# disk space utilization alarm
resource "aws_cloudwatch_metric_alarm" "disk_space_utilization" {
  alarm_name                = var.disk_space_name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "CWAgent"
  period                    = 180
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors disk space utilization"
  insufficient_data_actions = []
}

# RDS CPU Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "RDS_CPU" {
  alarm_name                = var.rds_cpu_name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors rds cpu utilization"
  insufficient_data_actions = []
}

resource "aws_cloudwatch_log_group" "mary_log_group" {
  name = var.log_group_name

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}
