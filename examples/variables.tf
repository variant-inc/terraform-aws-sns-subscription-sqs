variable "aws_resource_name_prefix" {
  type        = string
  description = "Prefix of team name to be applied to created resources."
}

variable "name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "topic_name" {
  description = "Topic to subscribe"
  type        = string
  default     = null
}