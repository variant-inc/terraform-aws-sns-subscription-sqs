data "aws_kms_key" "sns" {
  key_id = "alias/ops/sns"
}

module "sqs_queue" {
  source    = "../../"
  name      = "test-queue-naveen"
  topic_arn = "arn:aws:sns:us-east-1:account_num:dpl-test-topic-naveen"
  dlq_options = {
    "name" : "test_dlq",
    "visibility_timeout_seconds" : "90",
    "max_message_receive_count" : 5,
    "message_retention_seconds" : 120

  }
  kms_key_sns_arn = data.aws_kms_key.sns.arn
  tags = {
    "owner" : "naveen"
  }
}