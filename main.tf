locals{
  prefix = "${var.project_name}-${var.environment}"
}

module "vpc" {
  source            = "./modules/vpc" 
  prefix            = local.prefix
  create_custom_vpc = var.create_custom_vpc
  use_public_subnet = var.use_public_subnet
}

# module "rds_instance" {
#   source                              = "./modules/rds" 
#   prefix                              = local.prefix
#   create_custom_vpc                   = var.create_custom_vpc
#   use_public_subnet                   = var.use_public_subnet
#   instance_class                      = var.instance_class
#   database_name                       = var.database_name
#   db_username                         = var.db_username
#   vpc_id                              = module.vpc.vpc_id
#   db_subnet_group_name                = module.vpc.db_subnet_group_name
#   depends_on                          = [module.vpc]
# }

# module "glue_job" {
#   source                          = "./modules/glue" 
#   prefix                          = local.prefix
#   aws_region                      = var.aws_region
#   secret_name                     = module.rds_instance.secret_name
#   database_name                   = var.database_name
#   database_host                   = module.rds_instance.rds_endpoint
#   create_custom_vpc               = var.create_custom_vpc
#   python_file_name                = var.python_file_name
#   rds_instance_secret_manager_arn = module.rds_instance.rds_instance_secret_manager_arn
#   vpc_id                          = module.vpc.vpc_id
#   #subnet_ids                      = module.vpc.subnet_ids
#   depends_on                      = [module.vpc, module.rds_instance]
# }
