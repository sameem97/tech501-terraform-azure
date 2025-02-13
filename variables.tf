variable "public_key" {
  type        = string
  description = "The public key to be used for SSH access to the VM"
}

variable "app_source_image_id" {
  type        = string
  description = "The ID of the source image to use for the app VM"
}

variable "db_source_image_id" {
  type        = string
  description = "The ID of the source image to use for the db VM"
}

variable "private_ip_address" {
  type        = string
  description = "The fixed private IP address to assign to the db network interface"
}

variable "custom_data" {
  type        = string
  description = "The custom data to be used for the app VM"
}