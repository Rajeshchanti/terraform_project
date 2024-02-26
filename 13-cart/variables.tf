variable "common_tags" {
  type = map 
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}
variable "tags" {
    default = {
        component = "cart"
    }  
}
variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_name" {
  default = "techytrees.online"
}
variable "iam_instance_profile" {
  default = "project_role"
}