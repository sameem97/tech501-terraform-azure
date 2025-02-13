resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "tech501-sameem-terraform-app-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [var.network_interface_id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_id = var.app_source_image_id
  computer_name   = "sameem-app-vm"

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.public_key
  }

  custom_data = base64encode(var.custom_data)
}
