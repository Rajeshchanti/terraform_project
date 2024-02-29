module "roboshop" {
  #source                = "../../terraform_modules/aws_vpc"
  #source = "git::https://github.com/Rajeshchanti/terraform_module.git?ref=main"
  source = "git::https://github.com/Rajeshchanti/terraform_module/tree/3f23724a57af55b30d09d23efcbe49090839c2c3/aws_vpc"
  project_name          = var.project_name
  environment           = var.environment
  common_tags           = var.common_tags
  vpc_tags              = var.vpc_tags
  public_subnets_cidr   = var.public_subnets_cidr
  private_subnets_cidr  = var.private_subnets_cidr
  database_subnets_cidr = var.database_subnets_cidr
  is_peering_required   = var.is_peering_required
}
