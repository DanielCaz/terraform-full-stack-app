terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "danielcaz-dev"

    workspaces {
      name = "full-stack-app"
    }
  }


  required_version = "~> 1.8"
}

provider "aws" {
  region = var.region
}
