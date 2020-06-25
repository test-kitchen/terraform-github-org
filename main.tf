provider "github" {
  token        = var.github_token
  organization = "test-kitchen"
}

variable "github_token" {}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "test-kitchen"
    workspaces {
      name = "terraform-github-org"
    }
  }
}
