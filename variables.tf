variable "region" {
  type = string
}
 
variable "dockerhost-key-name" {
  default = "dockerhost-key"
  description = "Name of key in AWS"
  type = string
}

variable "dockerhost-instance-type" {
  description = "AWS instance type used for dockerhost instance"
  default = "t3.xlarge"
}

variable "my-ip" {
  description = "IP Address from which to get access to the public subnet in CIDR format (usually /32)"
  type = string
  default = ""
}

variable "owner_email" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "cflt_environment" {
  default = "prod"
}

variable "cflt_partition" {
  default = "sales"
}

variable "cflt_managed_by" {
  default = "user"
}

variable "cflt_managed_id" {
  type = string
}

variable "cflt_service" {
  description = "This is the theatre of operation, like EMEA or APAC"
  type = string
}