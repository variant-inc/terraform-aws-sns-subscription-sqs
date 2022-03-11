module "sqs_queue" {
  source                            = "terraform-aws-modules/sqs/aws"
  version                           = "~> 2.0"
  create                            = true
  name                              = var.name
  fifo_queue                        = var.fifo_queue
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  policy                            = var.policy
  redrive_policy                    = var.redrive_policy
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_key_sns_arn
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags                              = var.tags
}

#sns to sqs publish policies
data "aws_iam_policy_document" "topic_subscription_policy" {
  policy_id = "${var.name}-subscription"
  version   = "2012-10-17"
  statement {
    effect    = "Allow"
    resources = [module.sqs_queue.this_sqs_queue_arn]
    actions   = ["sqs:SendMessage"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }
    condition {
      test     = "ArnEquals"
      values   = [var.topic_arn]
      variable = "aws:SourceArn"
    }
  }
}

data "aws_sqs_queue" "queue_urls" {
  name = module.sqs_queue.this_sqs_queue_name
}

resource "aws_sqs_queue_policy" "topic_subscription_policy_binding" {
  policy    = data.aws_iam_policy_document.topic_subscription_policy.json
  queue_url = data.aws_sqs_queue.queue_urls.url
}

#sns to sqs subscription from sns
resource "aws_sns_topic_subscription" "topic_subscription" {
  topic_arn            = var.topic_arn
  protocol             = "sqs"
  endpoint             = module.sqs_queue.this_sqs_queue_arn
  raw_message_delivery = var.raw_message_delivery
}

#queue consumer policies
data "aws_iam_policy_document" "queue_receive_policy" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    resources = [module.sqs_queue.this_sqs_queue_arn]
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:ChangeMessageVisibilityBatch",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage"
    ]
  }

  statement {
    effect    = "Allow"
    resources = [var.kms_key_sns_arn]
    actions = [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ]
  }
}