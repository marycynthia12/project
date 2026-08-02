variable "log_group_name" {
  description = "The name of the CloudWatch log group"
  default     = "ecomerce-log-group"
}

variable "ec2_cpu_name" {
  description = "The name of the EC2 CPU Utilization Alarm"
  default     = "ec2-cpu-high1"
}

variable "ec2_health_name" {
  description = "The name of the EC2 Instance Health Alarm"
  default     = "ec2-instance-health"
}

variable "disk_space_name" {
  description = "The name of the Disk Space Utilization Alarm"
  default     = "disk-space-utilization"
}

variable "rds_cpu_name" {
  description = "The name of the RDS CPU Utilization Alarm"
  default     = "rds-cpu-high1"
}