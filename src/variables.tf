variable "region" {
  description = "AWS region for all resources."
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type for the workshop host."   
  type        = string
  default     = "t3.micro"
}

variable "name_prefix" {
  description = "Prefix applied to resource names so the workshop estate is easy to identify."
  type        = string
  default     = "triage"
}
