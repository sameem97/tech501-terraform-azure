resource "azurerm_public_ip" "app_ip" {
  name                = "tech501-sameem-terraform-app-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "app_nic" {
  name                = "tech501-sameem-terraform-app-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "tech501-sameem-terraform-app-nic-ip"
    subnet_id                     = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app_ip.id
  }
}

resource "azurerm_network_interface" "db_nic" {
  name                = "tech501-sameem-terraform-app-db-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "tech501-sameem-terraform-app-db-nic-ip"
    subnet_id                     = var.db_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address = "10.0.3.4"
  }
}

resource "azurerm_network_interface_security_group_association" "app_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.app_nic.id
  network_security_group_id = var.app_network_security_group_id
}

resource "azurerm_network_interface_security_group_association" "db_nsg_assoc" {
  network_interface_id = azurerm_network_interface.db_nic.id
  network_security_group_id = var.db_network_security_group_id
}