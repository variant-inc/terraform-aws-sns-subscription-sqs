data "aws_kms_key" "sns_alias" {
  key_id = "alias/ops/sns"
}
module "sqs_queue" {
  source = "../"

  name                     = var.name
  aws_resource_name_prefix = var.aws_resource_name_prefix
  topic_name           = var.topic_name
  kms_key_sns_alias_arn    = data.aws_kms_key.sns_alias.arn
  tags                     = var.tags
}