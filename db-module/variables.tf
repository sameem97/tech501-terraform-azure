variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the resources will be created"
}

variable "location" {
  type        = string
  description = "The location in which the resources will be created"
}

variable "network_interface_id" {
  type        = string
  description = "The ID of the network interface to associate with the network security group"
}

variable "db_source_image_id" {
  type        = string
  description = "The ID of the source image to use for the db VM"
}

variable "public_key" {
  type        = string
  description = "The public key to be used for SSH access to the VM"
}