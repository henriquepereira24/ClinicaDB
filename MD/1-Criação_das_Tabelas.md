# Criação das Tabelas
### Este script cria a estrutura da base de dados:

``` bash
-- Criação da Base de Dados
CREATE DATABASE ClinicaDB;

USE ClinicaDB;

-- Criação da tabela Pacientes e dos seus campos
CREATE TABLE Pacientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    DataNascimento DATE NOT NULL,
    Telefone VARCHAR(9)
);

-- Criação da tabela Médicos e dos seus campos
CREATE TABLE Médicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Especialidade VARCHAR(255) NOT NULL
);

-- Criação da tabela Consultas e dos seus campos
CREATE TABLE Consultas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PacienteID INT,
    MédicoID INT,
    DataConsulta DATETIME NOT NULL,
    Diagnóstico VARCHAR(255),
    FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID),
    FOREIGN KEY (MédicoID) REFERENCES Médicos(ID)
);

-- Criação da tabela Tratamentos e dos seus campos
CREATE TABLE Tratamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descrição TEXT,
    Preço DECIMAL(10, 2)
);

-- Criação da tabela Prescrições e dos seus campos
CREATE TABLE Prescrições (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultaID INT,
    TratamentoID INT,
    Quantidade INT,
    Preço DECIMAL(10, 2),
    FOREIGN KEY (ConsultaID) REFERENCES Consultas(ID),
    FOREIGN KEY (TratamentoID) REFERENCES Tratamentos(ID)
);
```

