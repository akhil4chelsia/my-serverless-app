variable "microservice_prefix" {
}

variable "microservice_name" {
}

variable "deployment_packages_bucket" {
}

variable "deployment_packages_folder" {
}

variable "lambda_hash" {
}

variable "vpc_name" {
}

variable "serviceTeam_tag" {
}

variable "serviceComponent_tag" {
}

variable "taggingVersion_tag" {
}

variable "createdBy_tag" {
}

variable "ttl_tag" {
}

variable "environment" {
}

variable "cors_allow_origin_header" {
  default = "*"
}

variable "log_level" {
  default = "INFO"
}

locals {
  region_shortcut        = replace(data.aws_region.current.name, "-", "")
  environment_shortcut   = replace(var.environment, "-", "")
  environment_tag        = "${local.region_shortcut}${local.environment_shortcut}"
  domain_name            = "aws-${data.aws_region.current.name}.${var.environment}.sdu-rds.com"
  resource_prefix        = "${data.aws_region.current.name}-${terraform.workspace}-${var.microservice_name}"
  domain_prefix          = terraform.workspace == "pre-prod" || terraform.workspace == "prod" ? var.microservice_prefix : "${var.microservice_prefix}-${terraform.workspace}"
  deployment_package_key = "${var.deployment_packages_folder}/${var.microservice_name}:${var.lambda_hash}.zip"
  enable_xray            = terraform.workspace == "hg80" || terraform.workspace == "pb82" || terraform.workspace == "h1" || terraform.workspace == "po84"
  vpc_id                 = data.aws_vpc.dataplatform_vpc.id

  tags = {
    "environment"       = local.environment_tag
    "service-team"      = var.serviceTeam_tag
    "service-component" = var.serviceComponent_tag
    "created-by"        = var.createdBy_tag
    "tagging-version"   = var.taggingVersion_tag
    "ttl"               = var.ttl_tag
    "name"              = "${local.environment_tag}-${var.serviceTeam_tag}-${var.createdBy_tag}-${var.serviceComponent_tag}"
  }
}
