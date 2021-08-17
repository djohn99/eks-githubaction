terraform {
  required_version = ">= 0.12"
}

# provider "random" {
#   version = "~> 3.0"
# }

# provider "local" {
#   version = "~> 1.4.0"
# }

# provider "null" {
#   version = "~> 3.0"
# }

# provider "template" {
#   version = "~> 2.1"
# }

provider "aws" {
  region = "us-east-1"
}