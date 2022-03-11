data "aws_kms_key" "sns" {
  key_id = "alias/ops/sns"
}

module "sqs_queue" {
  source          = "../"
  name            = var.name
  topic_arn       = var.topic_arn
  kms_key_sqs_arn = data.aws_kms_key.sns.arn
  tags            = var.tags
}