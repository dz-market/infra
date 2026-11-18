terraform {
  required_version = ">= 1.11.0"

  required_providers {
    kafka = {
      source  = "Mongey/kafka"
      version = "~> 0.13.2"
    }
  }

  backend "local" {
    path = "/state/terraform.tfstate"
  }
}

provider "kafka" {
  bootstrap_servers = ["redpanda:9092"]
  kafka_version     = "2.1.0"
  tls_enabled       = false
}
