module "github" {
  source            = "./modules/repository"
  name              = ".github"
  repository_team   = github_team.admins.id
  description       = "Community Health Files for Test-Kitchen repos"
  additional_topics = ["community"]
  status_checks     = ["markdownlint"]
}
