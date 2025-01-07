# Script PowerShell para destruir recursos Terraform

# Post-deployment
Push-Location "C:\Users\signacio\Projeto_Final_arq_containers\linuxtips-arquitetura-containers-aws-multiregion-vpc\post-deployment"
Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/backend.tfvars
terraform destroy -auto-approve -var-file=environment/terraform.tfvars
Pop-Location

# Deployment (SA-EAST-1)
Push-Location "C:\Users\signacio\Projeto_Final_arq_containers\linuxtips-arquitetura-containers-aws-multiregion-vpc\deployment"
Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/sa-east-1/backend.tfvars
terraform destroy -auto-approve -var-file=environment/sa-east-1/terraform.tfvars
Pop-Location

# Deployment (US-EAST-1) - Repare que este bloco acessa 'deployment' novamente
Push-Location "C:\Users\signacio\Projeto_Final_arq_containers\linuxtips-arquitetura-containers-aws-multiregion-vpc\deployment"
Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/us-east-1/backend.tfvars
terraform destroy -auto-approve -var-file=environment/us-east-1/terraform.tfvars
Pop-Location

# Pré-deployment
Push-Location "C:\Users\signacio\Projeto_Final_arq_containers\linuxtips-arquitetura-containers-aws-multiregion-vpc\pre-deployment"
Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/backend.tfvars
terraform destroy -auto-approve -var-file=environment/terraform.tfvars
Pop-Location