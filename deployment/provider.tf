provider "aws" {
  # access_key = "tungas"
  # secret_key = "strigus"
  # region = "us-east-1"
  # profile = "localstack"

  # s3_use_path_style = true
  # skip_credentials_validation = true
  # skip_metadata_api_check = true
  # skip_requesting_account_id = true

  # endpoints {
  #   ec2 = "http://127.0.0.1:4566"
  # }
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
