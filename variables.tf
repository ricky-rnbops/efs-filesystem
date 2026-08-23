# ─── efs-filesystem module variables ─────────────────────────────────────────

variable "name" {
  description = "Name tag for the EFS file system."
  type        = string
}

variable "kms_key_id" {
  description = "ARN of the KMS key used to encrypt the file system."
  type        = string
}

variable "subnet_ids" {
  description = "Subnets to create mount targets in (one per AZ)."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the mount targets."
  type        = list(string)
}

variable "performance_mode" {
  description = "EFS performance mode (generalPurpose or maxIO)."
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "EFS throughput mode (bursting, elastic, or provisioned)."
  type        = string
  default     = "bursting"
}
