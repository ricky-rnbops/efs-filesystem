# ─── EFS File System ──────────────────────────────────────────────────────────
# A single shared, encrypted EFS file system with one mount target per supplied
# subnet (one per AZ). Intended as the shared/durable tier for Tableau — the
# External File Store (extracts, backups) and other shared content. NOT used for
# Tableau's local data directory (Hyper engine), which lives on local EBS.

resource "aws_efs_file_system" "this" {
  encrypted        = true
  kms_key_id       = var.kms_key_id
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  tags = {
    Name = var.name
  }
}

# One mount target per subnet. EFS allows a single mount target per AZ, so the
# caller must pass at most one subnet per AZ.
resource "aws_efs_mount_target" "this" {
  count = length(var.subnet_ids)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_group_ids
}
