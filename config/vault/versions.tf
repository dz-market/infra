terraform {
  required_version = ">= 1.10"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.12"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }

  backend "local" {
    path = "/state/terraform.tfstate"
  }
}

provider "vault" {}