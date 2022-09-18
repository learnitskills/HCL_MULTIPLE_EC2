resource "aws_instance" "instance" {
  count                   = var.instance_count
  ami                     = data.aws_ami.ami.id
  instance_type           = element(var.instance_type, count.index)
  subnet_id               = element(data.aws_subnet.subnets.*.id, count.index)
  vpc_security_group_ids  = [data.aws_security_group.sg.id]
  disable_api_termination = var.termination

  tags = {
    Name = element(var.hostname, count.index)
  }

  root_block_device {
    volume_size           = var.root_vol_size
    volume_type           = var.root_vol_type
    delete_on_termination = var.root_vol_deletion
    kms_key_id            = data.aws_kms_key.key_arn.key_id
    encrypted             = var.encryption

    tags = {
    Name = "PrimaryVolume-${element(var.hostname , count.index)}"
  }
  }

}
