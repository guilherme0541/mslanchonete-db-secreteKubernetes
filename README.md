# mssistemalanchonete : DataBase

Este repositório serve para automatizar o provisionamento de um banco de dados postygres para o [mssistemalanchonete](https://github.com/kelvinlins/mssistemalanchonete.git) utilizando terraform.   
Através dele pode ser privisionada uma instancia RDS na AWS e uma secret no cluster EKS que é provisionado [aqui](https://github.com/guilherme0541/mslanchonete-infra-eks).

## Executando via github-actions
Para executar os scripts diretamente do github, é necessário criar a variable `AWS_REGION` que é o código da região AWS e  as secrets  `DB_PASS, AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY`, respectivamente o password a ser utilizado no DB, o ID e chave de acesso de um usuário AWS com permissões suficientes para criar e alterar os recursos citados acima.   
A automação ( **Deploy terraform** ) roda a partir de pull-requests para a `main`: na abertura ela valida os scripts, no merge ela aplica as alterações a infra. Também é possivel acionar a automação manualmente no menu action do github.
Para fazer o desprovisionamento da infra também existe uma action nesse repositório: **Deploy terraform**. Ela precisa ser acionada manualmente e escolhendo "Yes_sure" mo menu suspenso o processo é iniciado.


## Executando localmente
Para provisionar a infra na AWS rodando localmente o código desse repositório é necessário que o [aws-cli](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html) esteja instalado e configurado com acesso a conta AWS onde a infra deve ser provisionada .   
Também é necessário instalar  o [terraform](https://developer.hashicorp.com/terraform/install).  
**Atenção: utilizar recursos na nuvem custa dinheiro!!!**

### Provisionando a infra
Após clonar o repositório, altere o [backend](https://developer.hashicorp.com/terraform/language/backend) usado pelo terraform e abra o terminal na raiz do projeto e execute os comandos: 
```
terraform init
terraform plan
terraform apply
```
O console pedira que você informe o password e confirme a execução.   
Você pode alterar o nome do projeto e a região AWS através das variaveis `projectname e aws_region`, respectivamente e informar o password através da variavel `dbpassword`. Veja como informar valores de variaveis [aqui](https://developer.hashicorp.com/terraform/language/values/variables#variables-on-the-command-line).   

### Destruindo tudo
Para desprovisionar a infra, abra o terminal na raiz do projeto e execute os comandos: 
```
terraform init
terraform destroy
```
É necessário informar o password e confirmar a execução no console.