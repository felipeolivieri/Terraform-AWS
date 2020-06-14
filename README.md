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
terraform refresh
terraform output


Os comandos acima são mais que suficientes para provisionar qualquer ambiente em qualquer nuvem.

Para remover recursos da infraestrutura, posso simplesmente apagar um resource do código e rodar um "terraform apply" aou ainda rodar um "terraform destroy -target tipo.nome" como no exemplo: terraform destroy -target aws_s3_bucket.dev4

Como descobrir o ip publico das instâncias para acessar via ssh sem ter que acessar a console da aws?
Criei um arquivo chamado outputs.tf e inclui o seguinte:

output "ip_dev5" {
    value = aws_instance.dev5.public_ip
}

coloquei este pedaço de código para cada uma das instâncias. 

Para as instâncias que foram criadas de forma recursiva, utilizando o count, como fiz na dev0, dev1 e dev2, só consegui pegar o IP publico assim:

output "ips_dev0-1-2" {
    value = ["${aws_instance.dev.*.public_ip}"]
}

Se desde o inicio da criação, for gerado output com o IP publico, podemos pegar novamente o ip das instâncias rodando:

$terraform output


Próximos projetos:
1. Configurar mais recursos da AWS que não utilizei neste projeto: DNS, outros BDs, VPN, Load balancers, auto scaling, mais funcionalidades de segurança (WAF, firewall), adicinar usuários etc.
Imagino provisionar um ambiente de produção de uma aplicação que escala conforme necessidade - imagine um e-commerce, que no natal precisa aumentar 20x de tamanho para aguentar a carga. Minha idéia é criar uma infraestrutura na AWS capaz de fazer auto scaling, mas utilizando via código terraform.

2. Provisionar infraestrutura em várias clouds simultâneas: Oracle + Azure
Minha idéia é privisionar instâncias que se comunicam cross-cloud.
Imagino o ambiente anterior multi-cloud. É isso que quero fazer.