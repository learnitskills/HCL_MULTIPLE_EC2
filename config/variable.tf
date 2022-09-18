variable "instance_count" {}

variable "instance_type" {}

variable "subnetnames" {}

variable "security_group_name" {
  description = "Security group is hard-coded as we donot pass it during ADO pipeline execution"
  default     = "ECN-SG"
}

variable "termination" {
  description = "True: protection is enable , False: protection is disable"
  default = ""
}

variable "kms_key_arn" {}

variable "hostname" {}

variable "encryption" {
  default = true
}



//Root volume variables 
variable "root_vol_size" {
  default = 10
}

variable "root_vol_type" {
  default = "gp2"
}

variable "root_vol_deletion" {
  default = true
}



//Secondary volume variables
variable "secondary_volume_size" {
  default = ""
}

variable "secondary_volume_type" {
  default = "gp2"
}
