module "instance" {
  source                = "../config"
  instance_count        = "3"
  instance_type         = ["t2.small", "t2.micro", "t2.nano"]
  subnetnames           = ["ECN-SUBNET-2", "ECN-SUBNET-4", "ECN-SUBNET-5"]
  hostname              = ["Server1", "Server2", "Server3"]
  termination           = false
  kms_key_arn           = "your kms key arn"
  secondary_volume_size = [1, 2, 3]

}


