## Sistema de Gestão de Clínica

# Objetivo

Desenvolver um sistema de gestão de uma clínica que permita o controle de pacientes, médicos, consultas e tratamentos.

## Descrição do Projeto

Este projeto consiste na criação de um sistema de gestão para uma clínica médica, utilizando MySQL para a base de dados. O sistema permite o gerenciamento de pacientes, médicos, consultas e tratamentos, além de realizar consultas SQL, triggers, stored procedures e cursores para automatizar e garantir a integridade das operações.

## Estrutura do Projeto

    Diagrama ER da Base de Dados
        Um diagrama ER foi criado para visualizar as entidades e os relacionamentos entre elas.

    Criação das Tabelas
        Scripts SQL para a criação das tabelas necessárias na base de dados.

    Inserção de Dados de Exemplo
        Scripts SQL para a inserção de dados de exemplo nas tabelas criadas.

    Consultas SQL
        Consultas SQL para extrair informações específicas da base de dados.

    Triggers
        Triggers para automatizar tarefas e garantir a integridade dos dados.

    Stored Procedures
        Stored procedures para encapsular operações de inserção, atualização e cálculo.

    Cursores
        Cursores para gerar relatórios detalhados.

## Diagrama ER da Base de Dados
![Captura de ecrã de 2024-07-16 13-46-49](https://github.com/user-attachments/assets/e5d23103-f746-4e23-91cc-b4a84141b1a0)

O diagrama ER foi criado utilizando MySQL Workbench e ilustra as seguintes entidades:

    Pacientes (ID, Nome, DataNascimento, Telefone)
    Médicos (ID, Nome, Especialidade)
    Consultas (ID, PacienteID, MédicoID, DataConsulta, Diagnóstico)
    Tratamentos (ID, Nome, Descrição, Preço)
    Prescrições (ID, ConsultaID, TratamentoID, Quantidade, Preço)

# Instruções para Configuração e Utilização do Sistema de Gestão de Clínica
### 1. Configurar a Base de Dados
#### 1.1 Instalar o MySQL

Se ainda não tiver o MySQL instalado, siga estas etapas:

#### Windows:
1. Instale o MySQL Installer do site oficial: https://dev.mysql.com/downloads/workbench/.
2. Execute o instalador e siga as instruções na tela para instalar o MySQL Server e MySQL Workbench.

#### Linux:
Atualize seu repositório de pacotes:
Instale o MySQL Server:
```bash
sudo apt update
```
Instale o MySQL Server:
```bash
sudo apt install mysql-server
```
Inicie o serviço MySQL:
```bash
sudo service mysql start
```

#### 1.2 Criar a Base de Dados e Tabelas

1. Abra o MySQL Workbench (ou outro cliente de sua preferência) e conecte-se ao seu servidor MySQL.
2. Crie a base de dados e as tabelas necessárias executando os scripts.

#### 1.3 Inserir Dados de Exemplo

Execute o script a seguir para inserir dados de exemplo nas tabelas criadas.

### 2. Executar Consultas SQL

Para extrair informações da base de dados, execute as consultas SQL.

### 3. Implementar Triggers e Stored Procedures
#### 3.1 Criar Triggers

Para criar os triggers, execute o script.

#### 3.2 Criar Stored Procedures

Para criar as stored procedures, execute o script.

### 4. Gerar Relatórios com Cursores

Para criar um relatório detalhado utilizando cursores, execute o script.

### 5. Testar o Sistema

Após configurar a database e implementar todos os componentes,podes testar o sistema executando as stored procedures e triggers criadas.


