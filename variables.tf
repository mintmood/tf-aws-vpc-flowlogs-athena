variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "retention_days" {
  type    = number
  default = 30

  validation {
    condition     = var.retention_days >= 1
    error_message = "retention_days must be at least 1."
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}
