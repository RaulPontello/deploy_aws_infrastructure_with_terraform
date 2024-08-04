module "s3_bucket" {
  source         = "./modules/s3" 
  s3_bucket_name = var.s3_bucket_name
  tags           = var.tags
}

module "rds_instance" {
  source                              = "./modules/rds" 
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  rds_instance_class                  = var.rds_instance_class
  db_name                             = var.db_name
  db_username                         = var.db_username
  db_password                         = var.db_password
  port                                = var.port
  identifier                          = var.identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  publicly_accessible                 = var.publicly_accessible
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  tags                                = var.tags
}

module "lambda_function" {
    source                              = "./modules/lambda" 
}