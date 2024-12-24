#!/bin/bash

#Piseudo pipeline para pensar em como vai ficar a pipe no Github Actions
set -e

echo "Iniciando Rollout do Pré Deployment"

cd pre-deployment/

rm -rf .terraform
terraform init -backend-config=environment/backend.tfvars
terraform apply --auto-approve -var-file=environment/terraform.tfvars

echo "Finalizando Deploy do Pré Deployment"

cd ../

echo "Iniciando Rollout da Regiao US-EAST-1"

cd deployment/

rm -rf .terraform
terraform init -backend-config=environment/us-east-1/backend.tfvars
terraform apply --auto-aprove -var-file=environment/us-east-1/terraform.tfvars

echo "Finalizando Rollout da Regiao US-EAST-1"

cd ../

echo "Iniciando Rollout da Regiao SA-EAST-1"

cd deployment/

rm -rf .terraform
terraform init -backend-config=environment/sa-east-1/backend.tfvars
terraform apply --auto-aprove -var-file=environment/sa-east-1/terraform.tfvars

echo "Finalizando Rollout da Regiao SA-EAST-1"

cd ../

echo "Iniciando Rollout do Post Deployment"

cd post-deployment/

rm -rf .terraform
terraform init -backend-config=environment/backend.tfvars
terraform apply --auto-aprove -var-file=environment/terraform.tfvars

echo "Finalizando Rollout do Post Deployment"