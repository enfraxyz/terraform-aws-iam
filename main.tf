terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "random" {}

# Useless resource 1: Random string
resource "random_string" "useless_string" {
  length  = 16
  special = false
  upper   = false
}

# Useless resource 2: Random integer
resource "random_integer" "meaningless_number" {
  min = 100
  max = 999
}

# Useless resource 3: Null resource (executes nothing)
resource "null_resource" "do_nothing" {}

# Useless resource 4: Local file (doesn't get used)
resource "local_file" "dummy_file" {
  content  = "This file is completely useless."
  filename = "${path.module}/useless_file.txt"
}

# Output something meaningless
output "random_useless_string" {
  description = "A totally useless random string."
  value       = random_string.useless_string.result
}

output "meaningless_number" {
  description = "A meaningless random number."
  value       = random_integer.meaningless_number.result
}
