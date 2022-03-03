output "sqs_queues" {
  description = "SQS Queues Output"
  value       = module.sqs_queue.*
}

output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sqs_queue.this_sqs_queue_id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sqs_queue.this_sqs_queue_arn
}

output "sqs_queue_name" {
  description = "The ARN of the SQS queue"
  value       = module.sqs_queue.this_sqs_queue_name
}
