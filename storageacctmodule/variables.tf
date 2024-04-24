variable "resource_group_name" {
  type = string
  description = "name of resource group"
}

variable "resource_group_location" {
  type = string
  description = "location resource group is deployed to"
}

variable "assetname" {
  type = string
}

variable "enviroment" {
  type = string
  description = "env you are deploying to. ex dev, prod"
}

variable "instance_count" {
  type = number
  default = 1
  description = "how many you want to deploy"
}

variable "owner" {
  type = string
  description = "name of owner"
}