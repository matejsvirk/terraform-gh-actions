terraform {
  backend "remote" {
    organization = "matejsvirk-updated"

    workspaces {
      name = "gh-actions-fastly"
    }
  }
}
