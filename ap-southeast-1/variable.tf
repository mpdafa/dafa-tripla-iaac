variable "cluster_name" {
  type        = string
  default     = "dafa-tripla-eks"
  description = "EKS cluster name"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-08ca0d3e9b7c5d657"
  description = "VPC ID where the EKS cluster will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  default     = ["subnet-05a5378b281701998","subnet-0afb2758cae7e6228","subnet-0b029c0f5c74d2667"]
  description = "List of subnet IDs for EKS and node groups"
}

variable "environment" {
  type        = string
  default     = "staging"
  description = "Deployment environment"
}
