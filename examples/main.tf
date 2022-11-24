terraform {
  required_providers {
    hashicups = {
      version = "0.2"
      source  = "hashicorp.com/edu/hashicups"
    }
  }
}

provider "hashicups" {
  username = "education"
  password = "test123"
}

module "psl" {
  source = "./coffee"

  coffee_name = "Packer Spiced Latte"
}

resource "hashicups_order" "edu" {
  items {
    coffee {
      id = 1
    }
    quantity = 2
  }
  items {
    coffee {
      id = 2
    }
    quantity = 5
  }
}

resource "hashicups_order" "sample" {

}

output "edu_order" {
  value = hashicups_order.edu
}


data "hashicups_order" "order" {
  id = 2
}

output "order" {
  value = data.hashicups_order.order
}


output "psl" {
  value = module.psl.coffee
}
