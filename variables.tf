variable "MONGO_URI" {
  description = "MongoDB Atlas connection URI"
  type        = string
  sensitive   = true
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "taskmgrECS3"  # Default value (override when needed)
}

#terraform.tfvars | for another repo refactor split ECS and VPC repo separate
# variable "vpc_id" {
#   description = "vpc id"
#   type = string
#   sensitive = true
# }

# variable "db_username" {
#   description = "Database master user"
#   type = string
#   sensitive = true
# }

# variable "db_password" {
#   description = "Database master user password"
#   type = string
#   sensitive = true
# }