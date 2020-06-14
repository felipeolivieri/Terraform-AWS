# Terraform-AWS
Este repositorio contem codigos do terraform que fiz enquanto estudava a integração com a AWS.

Para utilizar a AWS, primeiro instalei a AWS CLI e criei um usuario na AWS com permissão de administrador, baixei o arquivo credentials.csv e configurei o terraform:

$ aws configure

preenchi os dados de usuario e chave que baixei (credentials.csv) e pronto, já posso utilizar o terraform.

Para acessar as instâncias, eu criei as chaves ssh (ssh-keygen) e fiz upload da chave publica na aws. Esta chave publica foi associada a todas as instâncias para que eu possa fazer ssh.

Utilizei o vscode da Microsoft para escrever o código, escolhi este porque já utilizo para outros códigos e existe um pllugin para o Terraform, ou seja, highlitining e ajuda na hora de escrever o código!

No código eu apenas escrevi no arquivo main.tf:

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

Comecei o projeto apenas com este arquivo, depois separei em diversos outros. O terraform não precisa de um arquivo específico. Na prática ele faz uma busca por *.tf e usa tudo que achar! Então vamos usar e abusar para organizar o código em arquivos.

Comandos utilizados do terraform para este laboratório:
terraform --help  
terraform init  
terraform plan  
terraform apply  
terraform show  
terraform show|grep -i status
terraform status  
terraform validate  
terraform destroy  
terraform destroy -target aws_s3_bucket.dev4


Os comandos acima são mais que suficientes para provisionar qualquer ambiente em qualquer nuvem.


Próximos projetos:
1. Configurar mais recursos da AWS que não utilizei neste projeto: DNS, outros BDs, VPN, Load balancers, auto scaling, mais funcionalidades de segurança (WAF, firewall), adicinar usuários etc.
Imagino provisionar um ambiente de produção de uma aplicação que escala conforme necessidade - imagine um e-commerce, que no natal precisa aumentar 20x de tamanho para aguentar a carga. Minha idéia é criar uma infraestrutura na AWS capaz de fazer auto scaling, mas utilizando via código terraform.

2. Provisionar infraestrutura em várias clouds simultâneas: Oracle + Azure
Minha idéia é privisionar instâncias que se comunicam cross-cloud.
Imagino o ambiente anterior multi-cloud. É isso que quero fazer.