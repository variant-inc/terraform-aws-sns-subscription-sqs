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

variable "topic_arn" {
  description = "Topic arn to subscribe"
  type        = string
  default     = null
}