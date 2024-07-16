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

O diagrama ER foi criado utilizando MySQL Workbench e ilustra as seguintes entidades:

    Pacientes (ID, Nome, DataNascimento, Telefone)
    Médicos (ID, Nome, Especialidade)
    Consultas (ID, PacienteID, MédicoID, DataConsulta, Diagnóstico)
    Tratamentos (ID, Nome, Descrição, Preço)
    Prescrições (ID, ConsultaID, TratamentoID, Quantidade, Preço)

## Instruções para Configuração e Utilização

### Configurar a Base de Dados

Execute os scripts SQL para criar o banco de dados e as tabelas.

Insira dados de exemplo utilizando os scripts fornecidos.

### Executar Consultas SQL

Utilize as consultas SQL para extrair informações conforme necessário.

### Triggers e Stored Procedures

Implemente os triggers e stored procedures para automatizar tarefas e garantir a integridade dos dados.

### Gerar Relatórios com Cursores

Utilize os cursores para gerar relatórios detalhados conforme as necessidades da clínica.
