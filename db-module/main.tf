resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "tech501-sameem-terraform-app-db-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [var.network_interface_id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_id = var.db_source_image_id
  computer_name   = "sameem-db-vm"

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.public_key
  }
}

# export DB_HOST=mongodb://<db_private_ip>:27017/posts