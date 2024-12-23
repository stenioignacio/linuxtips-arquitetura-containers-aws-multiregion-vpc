provider "aws" {
  profile                  = "lab"
  shared_config_files      = ["C:\\Users\\signacio\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\signacio\\.aws\\credentials"]
  region                   = var.region

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }
}

provider "aws" {
  alias                    = "peer"
  profile                  = "lab"
  shared_config_files      = ["C:\\Users\\signacio\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\signacio\\.aws\\credentials"]
  region                   = var.region_peer

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }

}
