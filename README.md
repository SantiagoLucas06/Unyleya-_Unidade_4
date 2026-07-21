# Projeto Unyleya - CI/CD com Terraform e Azure DevOps

## 📋 Descrição do Projeto

Este projeto demonstra a implementação de uma esteira CI/CD completa utilizando:
- **Terraform** para provisionamento de infraestrutura no Azure
- **Azure DevOps** para pipelines de CI (Build) e CD (Release)
- **Docker** para containerização da aplicação
- **Flask** para aplicação web Python

## 🏗️ Arquitetura

## 🚀 Como Executar

### Pré-requisitos

- Conta Azure com assinatura ativa
- Conta Docker Hub
- Azure DevOps organizado
- Terraform CLI instalado
- Azure CLI instalado

### Passos

1. **Fazer fork do repositório**
2. **Criar variáveis de ambiente** no Azure DevOps:
   - `dockerHubUsername`: Seu usuário Docker Hub
   - `resourceGroupName`: Nome do resource group
   - `projectName`: Nome do projeto

3. **Configurar Service Connections** no Azure DevOps:
   - Conexão com Azure (Service Principal)
   - Conexão com Docker Hub

4. **Executar a pipeline**:
   - CI: Build da imagem Docker
   - CD: Provisionamento da infra + Deploy

5. **Acessar a aplicação**:
   - URL: `https://unyleya-app.azurewebsites.net`

## 🔧 Configuração Terraform

1. Copie o arquivo de exemplo:
   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
