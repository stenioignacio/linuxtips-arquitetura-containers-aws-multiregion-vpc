provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }
}
