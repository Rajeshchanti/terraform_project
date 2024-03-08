module "vpn" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_vpc.default.id
  sg_name = "vpn"
  sg_description = "SG for VPN"
}
module "mongodb" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mongodb"
  sg_description = "SG for mongodb"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "redis" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "redis"
  sg_description = "SG for redis"
}
module "mysql" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mysql"
  sg_description = "SG for mysql"
}
module "rabbitmq" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "rabbitmq"
  sg_description = "SG for rabbitmq"
}
module "catalogue" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "catalogue"
  sg_description = "SG for Catalogue"
}

module "user" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "user"
  sg_description = "SG for user"
}
module "cart" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "cart"
  sg_description = "SG for cart"
}
module "shipping" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "shipping"
  sg_description = "SG for shipping"
}
module "payment" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "payment"
  sg_description = "SG for payment"
}
module "web" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "web"
  sg_description = "SG for web"
}
module "app_alb" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "app-alb"
  sg_description = "SG for App alb"
}
module "web_alb" {
  source = "git::https://github.com/Rajeshchanti/aws_sg_module.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "web-alb"
  sg_description = "SG for WEB alb"
}
# ************** vpn requests ************
resource "aws_security_group_rule" "vpn_app_alb" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.app_alb.sg_id
}
resource "aws_security_group_rule" "vpn_home" {
  security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 0
  from_port = 65535
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "vpn_mongodb" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.mongodb.sg_id
}
resource "aws_security_group_rule" "vpn_redis" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.redis.sg_id
}
resource "aws_security_group_rule" "vpn_mysql" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.mysql.sg_id
}
resource "aws_security_group_rule" "vpn_rabbitmq" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.rabbitmq.sg_id
}
resource "aws_security_group_rule" "vpn_catalogue" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.catalogue.sg_id
}
resource "aws_security_group_rule" "vpn_user" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.user.sg_id
}
resource "aws_security_group_rule" "vpn_cart" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.cart.sg_id
}
resource "aws_security_group_rule" "vpn_shipping" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.shipping.sg_id
}
resource "aws_security_group_rule" "vpn_payment" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.payment.sg_id
}
resource "aws_security_group_rule" "vpn_web" {
  source_security_group_id = module.vpn.sg_id
  type = "ingress"
  to_port = 22
  from_port = 22
  protocol = "tcp"
  security_group_id = module.web.sg_id
}

# mongodb accepting connections from catalogue
resource "aws_security_group_rule" "mongodb_catalogue" {
    source_security_group_id = module.catalogue.sg_id
    type = "ingress"
    to_port = 27017
    from_port = 27017
    protocol = "tcp"
    security_group_id = module.mongodb.sg_id
}
# mongodb accepting connections from user
resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type = "ingress"
  to_port = 27017
  from_port = 27017
  protocol = "tcp"
  security_group_id = module.mongodb.sg_id
}
# redis accepting connections from user
resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type = "ingress"
  to_port = 6379
  from_port = 6379
  protocol = "tcp"
  security_group_id = module.redis.sg_id
}
# redis accepting connections from cart
resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type = "ingress"
  to_port = 6379
  from_port = 6379
  protocol = "tcp"
  security_group_id = module.redis.sg_id
}
resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type = "ingress"
  to_port = 3306
  from_port = 3306
  protocol = "tcp"
  security_group_id = module.mysql.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment.sg_id
  type = "ingress"
  to_port = 5672
  from_port = 5672
  protocol = "tcp"
  security_group_id = module.rabbitmq.sg_id
}

# ************ app_alb Accepting Request ********** 
resource "aws_security_group_rule" "cart_app_alb" {
  source_security_group_id = module.cart.sg_id
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.app_alb.sg_id
}
resource "aws_security_group_rule" "shipping_app_alb" {
  source_security_group_id = module.shipping.sg_id
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.app_alb.sg_id
}
resource "aws_security_group_rule" "payment_app_alb" {
  source_security_group_id = module.payment.sg_id
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.app_alb.sg_id
}
resource "aws_security_group_rule" "web_app_alb" {
  source_security_group_id = module.web.sg_id
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.app_alb.sg_id
}

# ********* user requests **********
resource "aws_security_group_rule" "app_alb_user" {
  source_security_group_id = module.app_alb.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.user.sg_id
}
# resource "aws_security_group_rule" "web_user" {
#   source_security_group_id = module.web.sg.id
#   type = "ingress"
#   to_port = 8080
#   from_port = 8080
#   protocol = "tcp"
#   security_group_id = module.user.sg_id
# }

resource "aws_security_group_rule" "user_payment" {
  source_security_group_id = module.payment.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.user.sg_id
}

# *********** Catalogue requests ********************
resource "aws_security_group_rule" "app_alb_catalogue" {
  source_security_group_id = module.app_alb.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.catalogue.sg_id
}
# resource "aws_security_group_rule" "web_catalogue" {
#   source_security_group_id = module.web.sg_id
#   type = "ingress"
#   to_port = 8080
#   from_port = 8080
#   protocol = "tcp"
#   security_group_id = module.catalogue.sg_id
# }
# resource "aws_security_group_rule" "catalogue_cart" {
#   source_security_group_id = module.cart.sg_id
#   type = "ingress"
#   to_port = 8080
#   from_port = 8080
#   protocol = "tcp"
#   security_group_id = module.catalogue.sg_id
# }


# *********** Cart requests *****************
resource "aws_security_group_rule" "app_alb_cart" {
  source_security_group_id = module.app_alb.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.cart.sg_id
}
# resource "aws_security_group_rule" "web_cart" {
#   source_security_group_id = module.web.sg.id
#   type = "ingress"
#   to_port = 8080
#   from_port = 8080
#   protocol = "tcp"
#   security_group_id = module.cart.sg_id
# }
resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = module.payment.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.cart.sg_id
}
resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.cart.sg_id
}

# *********** Shipping requests **************
resource "aws_security_group_rule" "app_alb_shipping" {
  source_security_group_id = module.app_alb.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.shipping.sg_id
}
# resource "aws_security_group_rule" "web_shipping" {
#   source_security_group_id = module.web.sg.id
#   type = "ingress"
#   to_port = 8080
#   from_port = 8080
#   protocol = "tcp"
#   security_group_id = module.shipping.sg_id
# }

# ************** payment requests ****************
resource "aws_security_group_rule" "app_alb_payment" {
  source_security_group_id = module.app_alb.sg_id
  type = "ingress"
  to_port = 8080
  from_port = 8080
  protocol = "tcp"
  security_group_id = module.payment.sg_id
}


resource "aws_security_group_rule" "internet_web_alb" {
  cidr_blocks = [ "0.0.0.0/0" ]
  type = "ingress"
  to_port = 443
  from_port = 443
  protocol = "tcp"
  security_group_id = module.web_alb.sg_id
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = [ "0.0.0.0/0" ]
  type = "ingress"
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = module.web.sg_id
}