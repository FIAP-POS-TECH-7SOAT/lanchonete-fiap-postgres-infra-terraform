# lanchonete-fiap-postgres-infra-terraform

Este repositório tem como finalidade criar a infraestrutura de um banco de dados postgresql na AWS. Logo há uma necessidade de criar uma conta na AWS, acessar suas variáveis de acesso para substituir em cada variável correspondente.
Também há uma necessidade de instalar o Terraform

## Design do banco de dados:

![alt text](https://github.com/FIAP-POS-TECH-7SOAT/lanchonete-fiap-postgres-infra-terraform/blob/main/diagrama_db.png?raw=true)

## Motivo da escolha do banco relacional:

Acreditando que nosso sistema não precisará ter mais grandes adequações/modelagem, o banco relacional se torna a melhor escolha já que ele já está sendo utilizado e não há uma necessidade de realizar mais grandes adaptações.
Outro motivo muito positivo para a escolha, é que há uma possibilidade maior de encontrar membros que já possui familiaridade com ele, assim podem ter mais condições de manutenção.

## Comandos para execução do Terraform

Após ter feito todos os passos acima, execute os comandos abaixo

```
terraform init
```

Se você criar o arquivo env.tfvars poderá utilizar o comando abaixo

```
terraform plan -var-file="env.tfvars"
```

caso contrário, execute

```
terraform plan
```

A diferença entre os dois comandos acima é que no primeiro não há necessidade de passar variável, uma a uma.

Agora execute o comando abaixo

```
terraform apply -var-file="env.tfvars"
```

ou

```
terraform apply
```

## Exemplo do arquivo env.tfvars

Existe um arquivo como exemplo para o env.tfvars

aws_access_key_id = ""
aws_secret_access_key = ""
aws_region = ""
aws_session_token = ""
postgres_db_name = ""
postgres_db_username = ""
postgres_db_password = ""
