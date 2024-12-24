provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }
}


provider "aws" {
  alias  = "peer"
  region = var.region_peer

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }

}
