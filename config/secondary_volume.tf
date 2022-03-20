resource "aws_ebs_volume" "sec_volume" {
  count             = var.instance_count
  availability_zone = element(data.aws_subnet.subnets.*.availability_zone, count.index)
  size              = element(var.secondary_volume_size, count.index)
  type              = var.secondary_volume_type
  kms_key_id        = data.aws_kms_key.key_arn.key_id
  encrypted         = var.encryption

  tags = {
    Name = "Secondary-Volume-${count.index}"
  }
}

resource "aws_volume_attachment" "volume_attach" {
  count        = length(var.secondary_volume_size)
  device_name  = "/dev/xvde"
  volume_id    = element(aws_ebs_volume.sec_volume.*.id, count.index)
  instance_id  = element(aws_instance.instance.*.id, count.index)
  force_detach = "true"

  depends_on = [
    aws_instance.instance
  ]
}



