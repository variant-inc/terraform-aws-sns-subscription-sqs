# terraform-aws-sqs-queue-topic-subscription
Terraform module to create AWS SQS queue

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sqs_queue"></a> [sqs\_queue](#module\_sqs\_queue) | terraform-aws-modules/sqs/aws | ~> 3.2.0 |
| <a name="module_sqs_queue_dlq"></a> [sqs\_queue\_dlq](#module\_sqs\_queue\_dlq) | terraform-aws-modules/sqs/aws | ~> 3.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic_subscription.topic_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sqs_queue_policy.topic_subscription_policy_binding](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_iam_policy_document.queue_receive_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.topic_subscription_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_sqs_queue.queue_urls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sqs_queue) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `null` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | `number` | `null` | no |
| <a name="input_dlq_options"></a> [dlq\_options](#input\_dlq\_options) | Attributes to set to DLQ queue | `map(string)` | `{}` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `null` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `null` | no |
| <a name="input_kms_key_sns_arn"></a> [kms\_key\_sns\_arn](#input\_kms\_key\_sns\_arn) | The ID(ARN) of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `null` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON policy for the SQS queue | `string` | `null` | no |
| <a name="input_raw_message_delivery"></a> [raw\_message\_delivery](#input\_raw\_message\_delivery) | Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) | `bool` | `false` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `2` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_topic_arn"></a> [topic\_arn](#input\_topic\_arn) | Topic arn to subscribe | `string` | `null` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue_receive_policy"></a> [queue\_receive\_policy](#output\_queue\_receive\_policy) | AWS IAM Policy document to allow message recieve to created queue(s) |
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sqs_queue_dlq_arn"></a> [sqs\_queue\_dlq\_arn](#output\_sqs\_queue\_dlq\_arn) | The ARN of the SQS DLQ queue |
| <a name="output_sqs_queue_id"></a> [sqs\_queue\_id](#output\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sqs_queue_name"></a> [sqs\_queue\_name](#output\_sqs\_queue\_name) | The ARN of the SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->