# Cursores
## Utilizar cursores para gerar um relatório que lista todos os pacientes e as suas consultas num determinado período:

```bash
DELIMITER //

USE ClinicaDB;

CREATE PROCEDURE RelatorioPacientesConsultas(IN pInicio DATE, IN pFim DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pID INT;
    DECLARE pNome VARCHAR(100);
    DECLARE cur CURSOR FOR
        SELECT Pacientes.ID, Pacientes.Nome
        FROM Pacientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pID, pNome;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT pNome AS Paciente, Consultas.DataConsulta, Consultas.Diagnóstico
        FROM Consultas
        WHERE Consultas.PacienteID = pID AND Consultas.DataConsulta BETWEEN pInicio AND pFim;
    END LOOP;

    CLOSE cur;
END;

//

DELIMITER ;


//

DELIMITER ;
```