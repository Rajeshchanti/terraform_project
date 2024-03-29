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
        component = "app_alb"
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