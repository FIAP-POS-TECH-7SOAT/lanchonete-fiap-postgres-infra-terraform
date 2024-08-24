# lanchonete-fiap-postgres-infra-terraform

Este repositório tem como finalidade criar a infraestrutura de um banco de dados postgresql na AWS. Logo há uma necessidade de criar uma conta na AWS, acessar suas variáveis de acesso para substituir em cada variável correspondente.
Também há uma necessidade de instalar o Terraform

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

aws_access_key_id = ""
aws_secret_access_key = ""
aws_region = ""
aws_session_token = ""
postgres_db_name = ""
postgres_db_username = ""
postgres_db_password = ""
