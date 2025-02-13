variable "public_key" {
  type        = string
  description = "The public key to be used for SSH access to the VM"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the resources will be created"
}

variable "location" {
  type        = string
  description = "The location in which the resources will be created"
}

variable "app_subnet_id" {
  type        = string
  description = "The ID of the subnet in which the resources will be created"
}

variable "db_subnet_id" {
  type        = string
  description = "The ID of the subnet in which the resources will be created"
}

variable "app_network_security_group_id" {
  type        = string
  description = "The ID of the network security group to associate with the app network interface"
}

variable "db_network_security_group_id" {
  type        = string
  description = "The ID of the network security group to associate with the db network interface"
}

variable "private_ip_address" {
  type        = string
  description = "The fixed private IP address to assign to the db network interface"
} 