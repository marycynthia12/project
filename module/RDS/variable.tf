variable "db_password" {
  description = "The password for the RDS instance."
  sensitive   = true
}

variable "db_username" {
  description = "The username for the RDS instance."
  default     = "postgres"
}

variable "db_name" {
  description = "The name of the database to create when the RDS instance is created."
  default     = "mydb"
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the RDS instance."
}