provider "aws" {
  profile                  = "lab" #Essa tem que todos os recursos fora REDE
  shared_config_files      = ["C:\\Users\\signacio\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\signacio\\.aws\\credentials"]
  region                   = var.region

  default_tags {
    tags = {
      Name = "curso-arquitetura-de-containers"
    }
  }
}
