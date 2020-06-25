resource "github_team" "admins" {
  name        = "admins"
  description = "Admins of the test-kitchen org"
  privacy     = "closed"
}

resource "github_membership" "xorima" {
  username = "Xorima"
  role     = "admin"
}

resource "github_team_membership" "admins-xorima" {
  team_id  = github_team.admins.id
  username = "Xorima"
  role     = "maintainer"
}
