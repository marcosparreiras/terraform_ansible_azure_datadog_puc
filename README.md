# Projeto de Provisionamento e Configuração com Terraform e Ansible

Este projeto demonstra como provisionar e configurar infraestrutura na Azure usando Terraform e Ansible, incluindo a integração com Datadog para monitoramento.

## Resumo

### TERRAFORM:
- Uma rede virtual
- Uma subnet
- 2x VMs dentro da subnet
- Um IP público para cada VM
- As duas VMs são acessíveis via SSH (porta 22)
- A VM1 é acessível via porta 80 (HTTP)
- As 2x VMs são acessíveis através de uma mesma chave privada
- Ao final do provisionamento das 2 VMs, um arquivo de inventário Ansible é gerado sendo que a VM1 está no grupo web e a VM2 está no grupo db.

### ANSIBLE:

- Grupo web tem o pacote nginx instalado e seu serviço habilitado e inicializado.
- Grupo db tem o pacote postgres instalado e seu serviço hablitado e inicializado.
- Todos os grupos tem um usuário chamado acmeuser, com seu diretório home criado, e senha aulapuc1234
- Grupo web tem um arquivo chamado index.html dentro do diretório /var/www/html/ e o conteúdo do arquivo é o valor da variável ansible_hostname, o mode do arquivo é 0644, o owner é root e o group é root.

### DATADOG:

- Todos os grupos estão configurados com o agente da Datadog instalado e habilitado.

## Passos para Execução 

### Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- Terraform
- Ansible

### 1. Configuração Inicial com Terraform

1. Renomeie o arquivo `terraform.tfvars.template` para `terraform.tfvars` e preencha os dados necessários, como suas credenciais da Azure.

2. Inicialize o diretório do Terraform:

```bash
terraform init
```

3. Gere e revise o plano de execução:

```bash
terraform plan -out plan.tfplan
```

4. Aplique o plano de execução para provisionar a infraestrutura:

```bash
terraform apply plan.tfplan
```

5. Configure a permissão da chave SSH gerada para acesso às máquinas provisionadas:

```bash
sudo chmod 400 private_key.pem
```
### 2. Configuração com Ansible

1. Navegue para o diretório do Ansible:

```bash
cd ansible
```

2. Renomeie o arquivo `group_vars/all.yml.template` para `group_vars/all.yml` e preencha as variáveis faltantes conforme o necessário para configurar o ambiente.

3. Execute o playbook principal para configurar os servidores:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

4. Instale a coleção Ansible Datadog:

```bash
ansible-galaxy collection install datadog.dd
```

5. Execute o playbook para configurar o agente Datadog nos servidores:

```bash
ansible-playbook -i inventory.ini datadog.yml
```
