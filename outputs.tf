output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sqs_queue.sqs_queue_id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sqs_queue.sqs_queue_arn
}

output "sqs_queue_dlq_arn" {
  description = "The ARN of the SQS DLQ"
  value       = module.sqs_queue_dlq.sqs_queue_arn
}

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sqs_queue.sqs_queue_name
}

output "sqs_queue_dlq_name" {
  description = "The name of the SQS DLQ"
  value       = module.sqs_queue_dlq.sqs_queue_name
}

output "queue_receive_policy" {
  description = "AWS IAM Policy document to allow message recieve to created queue(s)"
  value       = data.aws_iam_policy_document.queue_receive_policy
}
