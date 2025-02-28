locals{
  prefix = "${var.project_name}-${var.environment}"
}

module "vpc" {
  source            = "./modules/vpc" 
  prefix            = local.prefix
  create_custom_vpc = var.create_custom_vpc
}

module "rds_instance" {
  source                              = "./modules/rds" 
  prefix                              = local.prefix
  create_custom_vpc                   = var.create_custom_vpc
  instance_class                      = var.instance_class
  rds_instance_engine                 = var.rds_instance_engine
  db_name                             = var.db_name
  db_username                         = var.db_username
  vpc_id                              = module.vpc.vpc_id
  db_subnet_group_name                = module.vpc.db_subnet_group_name
  depends_on                          = [module.vpc]
}

module "lambda_function" {
  source                          = "./modules/lambda" 
  prefix                          = local.prefix
  create_custom_vpc               = var.create_custom_vpc
  lambda_source_file              = var.lambda_source_file
  rds_instance_secret_manager_arn = module.rds_instance.rds_instance_secret_manager_arn
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.subnet_ids
  depends_on                      = [module.vpc, module.rds_instance]
}
