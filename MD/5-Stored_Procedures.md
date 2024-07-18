# Stored Procedures

## Stored procedures encapsulam operações de inserção, atualização e cálculo:

```bash
-- 1. Registrar uma Nova Consulta
DELIMITER //

CREATE PROCEDURE RegistrarConsulta(IN pPacienteID INT, IN pMédicoID INT, IN pDataConsulta DATETIME, IN pDiagnóstico TEXT)
BEGIN
    INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
    VALUES (pPacienteID, pMédicoID, pDataConsulta, pDiagnóstico);
END;

//

DELIMITER ;

-- 2. Atualizar os Dados de um Paciente
DELIMITER //

CREATE PROCEDURE AtualizarPaciente(IN pID INT, IN pNome VARCHAR(100), IN pDataNascimento DATE, IN pTelefone VARCHAR(15))
BEGIN
    UPDATE Pacientes
    SET Nome = pNome, DataNascimento = pDataNascimento, Telefone = pTelefone
    WHERE ID = pID;
END;

//

DELIMITER ;

-- 3. Calcular o Total de Consultas Realizadas num Determinado Período
DELIMITER //

CREATE PROCEDURE TotalConsultas(IN pInicio DATE, IN pFim DATE, OUT pTotal INT)
BEGIN
    SELECT COUNT(*) INTO pTotal
    FROM Consultas
    WHERE DataConsulta BETWEEN pInicio AND pFim;
END;

//

DELIMITER ;
```

## Explicação:

1. Esta stored procedure insere uma nova consulta na tabela Consultas. Ela recebe como parâmetros o ID do paciente, o ID do médico, a data e hora da consulta e o diagnóstico.
2. Esta stored procedure atualiza os dados de um paciente na tabela Pacientes. Ela recebe como parâmetros o ID do paciente, o nome, a data de nascimento e o telefone.
3. Esta stored procedure calcula o total de consultas realizadas num determinado período. Ela recebe como parâmetros a data de início e a data de fim do período, e retorna o total de consultas realizadas nesse intervalo.

