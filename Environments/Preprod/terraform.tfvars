rgs = {
  rg1 = {
    name     = "aatif-rg"
    location = "westus"
  }
  rg2 = {
    name     = "aatif-rg"
    location = "westus"
  }
  rg3 = {
    name     = "aatif-rg"
    location = "westus"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-prod"
    location            = "westus"
    resource_group_name = "aatif-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "aatif-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "aatif-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.2.0/24"]
  }
    subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "aatif-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.3.0/26"]
  }
    subnet4 = {
    name                 = "appgw-subnet"
    resource_group_name  = "aatif-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "pip-aatif-frontend-vm"
    resource_group_name = "aatif-rg"
    location            = "westus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  
  pip3 = {
    name                = "pip-bastion"
    resource_group_name = "aatif-rg"
    location            = "westus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip4 = {
    name                = "pip-appgw"
    resource_group_name = "aatif-rg"
    location            = "westus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

vms = {
  vm1 = {
    nic_name        = "frontend-vm-nic"
    location        = "westus"
    rg_name         = "aatif-rg"
    nic_subnet_name = "frontend-subnet"
    nic_vnet_name   = "vnet-prod"
    nic_pip_name    = "pip-aatif-frontend-vm"
    vm_name         = "frontend-vm"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "aamohamm"
  }
  vm2 = {
    nic_name        = "backend-vm-nic"
    location        = "westus"
    rg_name         = "aatif-rg"
    nic_subnet_name = "backend-subnet"
    nic_vnet_name   = "vnet-prod"
    nic_pip_name    = "pip-aatif-backend-vm"
    vm_name         = "backend-vm"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "aamohamm"
  }
}

nsgs = {
  nsg1 = {
    name                = "nsg-frontend-prod"
    location            = "westus"
    resource_group_name = "aatif-rg"
  }
}

subnet_nsg_associations = {
  assoc1 = {
    subnet_key = "subnet1"
    nsg_key    = "nsg1"
    # Note: Aapko yaha subnet ka actual resource ID dena hoga, ya module output use karna hoga.
  }
}

vnet_peerings = {}

