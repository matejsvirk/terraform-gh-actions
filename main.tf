terraform {
  backend "remote" {
    organization = "matejsvirk"

    workspaces {
      name = "gh-actions-fastly"
    }
  }
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "0.30.0"
    }
  }
}


resource "fastly_service_v1" "demo" {
  name = "demofastly"

  domain {
    name    = "demo.matejtesting.com"
    comment = "demo"
  }

  backend {
    address = "127.0.0.1"
    name    = "localhost 321"
    port    = 80
  }

  force_destroy = true
}

variable "FASTLY_API_KEY" {
  type      = string
}

provider "fastly" {
  api_key = "${var.FASTLY_API_KEY}"
}