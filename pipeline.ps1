# Pseudopipeline em PowerShell para Github Actions

Write-Host "Iniciando Rollout do Pré Deployment"

Push-Location pre-deployment

Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/backend.tfvars
terraform apply -auto-approve -var-file=environment/terraform.tfvars

Write-Host "Finalizando Deploy do Pré Deployment"

Pop-Location

Write-Host "Iniciando Rollout da Regiao US-EAST-1"

Push-Location deployment

Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/us-east-1/backend.tfvars
terraform apply -auto-approve -var-file=environment/us-east-1/terraform.tfvars

Write-Host "Finalizando Rollout da Regiao US-EAST-1"

Pop-Location

Write-Host "Iniciando Rollout da Regiao SA-EAST-1"

Push-Location deployment

Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/sa-east-1/backend.tfvars
terraform apply -auto-approve -var-file=environment/sa-east-1/terraform.tfvars

Write-Host "Finalizando Rollout da Regiao SA-EAST-1"

Pop-Location

Write-Host "Iniciando Rollout do Post Deployment"

Push-Location post-deployment

Remove-Item -Recurse -Force .terraform
terraform init -backend-config=environment/backend.tfvars
terraform apply -auto-approve -var-file=environment/terraform.tfvars

Write-Host "Finalizando Rollout do Post Deployment"