# Cursores
## Utilizar cursores para gerar um relatório que lista todos os pacientes e as suas consultas num determinado período:

```bash
DELIMITER //

CREATE PROCEDURE RelatorioPacientesConsultas(IN pInicio DATE, IN pFim DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
        SELECT Pacientes.Nome, Consultas.DataConsulta, Consultas.Diagnóstico
        FROM Pacientes
        JOIN Consultas ON Pacientes.ID = Consultas.PacienteID
        WHERE Consultas.DataConsulta BETWEEN pInicio AND pFim;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO @PacienteNome, @DataConsulta, @Diagnóstico;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT @PacienteNome, @DataConsulta, @Diagnóstico;
    END LOOP;
    CLOSE cur;
END;

//

DELIMITER ;
```
