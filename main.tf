locals{
  suffix = "${var.aws_region}-${var.environment}"
  prefix = "side-project"
}

module "vpc" {
  source            = "./modules/vpc" 
  suffix            = local.suffix
  prefix            = local.prefix
  create_custom_vpc = var.create_custom_vpc
}

module "rds_instance" {
  source                              = "./modules/rds" 
  suffix                              = local.suffix
  prefix                              = local.prefix
  create_custom_vpc                   = var.create_custom_vpc
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  db_username                         = var.db_username
  db_password                         = var.db_password
  vpc_id                              = module.vpc.vpc_id
  db_subnet_group_name                = module.vpc.db_subnet_group_name
  depends_on                          = [module.vpc]
  tags                                = var.tags
}

# module "lambda_function" {
#   source       = "./modules/lambda" 
#   suffix       = local.suffix
#   prefix       = local.prefix
#   source_file  = var.source_file
#   vpc_id       = module.vpc.vpc_id
#   subnet_ids   = module.vpc.subnet_ids
#   depends_on   = [module.vpc]
# }

# module "s3_bucket" {
#   source         = "./modules/s3" 
#   s3_bucket_name = var.s3_bucket_name
#   tags           = var.tags
#   depends_on     = [module.vpc, module.rds_instance]
# }