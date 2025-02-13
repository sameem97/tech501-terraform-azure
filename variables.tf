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