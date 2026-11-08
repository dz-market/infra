terraform {
  required_version = ">= 1.11.0"

  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.27.0"
    }
  }

  backend "local" {
    path = "/state/terraform.tfstate"
  }
}

provider "postgresql" {
  host            = "postgres"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}
