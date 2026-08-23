output "file_system_id" {
  description = "EFS file system ID."
  value       = aws_efs_file_system.this.id
}

output "dns_name" {
  description = "DNS name of the EFS file system (for NFS mounts)."
  value       = aws_efs_file_system.this.dns_name
}
