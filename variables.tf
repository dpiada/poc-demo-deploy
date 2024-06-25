######################################
#  AWS region and Naming Convention  #
######################################
variable "region" {
  type        = string
  description = "The AWS region where to create the cluster."
  default     = "eu-west-1"
}

variable "deploy_tags" {
  type        = map(string)
  description = "The tags to put on the resources."
  default = {
    "CreationType" : "opentofu",
    "Environment" : "demo",
    "Product/Project" : "poc-demo-deploy"
  }
}

variable "machine-instance-type" {
  type        = string
  description = "the instance type for the ec2"
  default     = "t3a.small"
}

variable "project_name" {
  type        = string
  description = "name of the project"
}

variable "user_data_base64" {
  type        = string
  description = "use script userdata in base64"
  default     = ""
}