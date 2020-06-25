variable "name" {}

variable "description" {
  default = ""
}

locals {
  default_description = "Development repository for the ${var.name} test-kitchen driver"
  description         = var.description == "" ? local.default_description : var.description
}

variable "repository_team" {
  description = "ID of the team that should own the repo, gives push access"
}

variable "homepage_url" {
  default     = "https://kitchen.ci"
  description = "Home page URL for the Git repo"
}

variable "enforce_admins" {
  default = false
}

variable "require_ci_pass" {
  default = true
}

variable "status_checks" {
  type    = list(string)
}

variable "has_wiki" {
  default = false
}

variable "has_projects" {
  default = true
}

variable "team_permission" {
  default = "push"
}

variable "everyone_permission" {
  default = "push"
}

# Pull Request Reviews
variable "dismiss_stale_reviews" {
  default = true
}

variable "require_code_owner_reviews" {
  default = false
}

variable "archived" {
  default = false
}

locals {
  default_topics = ["test-kitchen","infrastructre", "testing" "${replace(replace(var.name, "_", "-"), ".", "")}", "terraform-managed"]
  topics         = concat(local.default_topics, var.additional_topics)
}

variable "additional_topics" {
  type    = list(string)
  default = ["driver"]
}

variable "auto_init" {
  default = true

  description = <<DESCRIPTION
  This is an option that initializes the repo, it defaults to true. If it is set
  to false then it will not enable branch protection. The only use cases where
  you might want this is to create a project based on another project such as
  needing to use the import api or doing a bare clone. This setting only really
  applies (from github api perspective) when the repo is initially created,
  however as we can only set up branch protection if the repo has been initialized
  with the master branch we use it as well to control branch protections being
  enabled. If you need to handle one of these edgecases you should set `auto_init`
  to false initially so the repo can be created. After its been created and
  commits/hostory migrated (be it bare clone or import api) you would then set
  this to true which should enable branch protections.
DESCRIPTION
}
