provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = local.common_tags
  }
}
