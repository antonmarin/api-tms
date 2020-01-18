terraform {
  backend "remote" {
    organization = "antonmarin"

    workspaces {
      name = "api-tms-prod"
    }
  }
}
