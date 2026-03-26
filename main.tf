terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "null" {}
provider "random" {}

resource "random_pet" "name" {
  length = 2
}

resource "null_resource" "example3" {
  triggers = {
    name = random_pet.name.id
  }

  provisioner "local-exec" {
    command = "echo Created resource with name ${random_pet.name.id}"
  }
}
