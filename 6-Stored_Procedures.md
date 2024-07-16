# Stored Procedures

## Stored procedures encapsulam operações de inserção, atualização e cálculo:

```bash
-- Registrar uma Nova Consulta
DELIMITER //

CREATE PROCEDURE RegistrarConsulta(IN pPacienteID INT, IN pMédicoID INT, IN pDataConsulta DATETIME, IN pDiagnóstico TEXT)
BEGIN
    INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
    VALUES (pPacienteID, pMédicoID, pDataConsulta, pDiagnóstico);
END;

//

DELIMITER ;

-- Atualizar os Dados de um Paciente
DELIMITER //

CREATE PROCEDURE AtualizarPaciente(IN pID INT, IN pNome VARCHAR(100), IN pDataNascimento DATE, IN pTelefone VARCHAR(15))
BEGIN
    UPDATE Pacientes
    SET Nome = pNome, DataNascimento = pDataNascimento, Telefone = pTelefone
    WHERE ID = pID;
END;

//

DELIMITER ;

-- Calcular o Total de Consultas Realizadas num Determinado Período
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
