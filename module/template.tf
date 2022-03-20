module "instance" {
  source                = "../config"
  instance_count        = "3"
  instance_type         = ["t2.small", "t2.micro", "t2.nano"]
  subnetnames           = ["ECN-SUBNET-2", "ECN-SUBNET-4", "ECN-SUBNET-5"]
  hostname              = ["Server1", "Server2", "Server3"]
  termination           = false
  kms_key_arn           = "arn:aws:kms:us-east-1:229871141864:key/fbfacd0d-a394-4c38-9f98-acac74ec08e3"
  secondary_volume_size = [1, 2, 3]

}


