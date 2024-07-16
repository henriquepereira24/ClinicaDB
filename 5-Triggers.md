# Triggers
## Triggers são usados para automatizar tarefas e garantir a integridade dos dados:

```bash
-- Trigger para Atualizar o Histórico de Consultas do Paciente Após a Inserção de uma Nova Consulta
DELIMITER //

CREATE TRIGGER AtualizarHistoricoConsultas
AFTER INSERT ON Consultas
FOR EACH ROW
BEGIN
    -- Placeholder para ações após inserção de uma consulta.
END;
//

DELIMITER ;

-- Trigger para Impedir a Inserção de uma Consulta se o Médico Não Estiver Disponível
DELIMITER //

CREATE TRIGGER VerificarDisponibilidadeMedico
BEFORE INSERT ON Consultas
FOR EACH ROW
BEGIN
    DECLARE disponibilidade INT;
    SELECT COUNT(*) INTO disponibilidade
    FROM Consultas
    WHERE MédicoID = NEW.MédicoID AND DataConsulta = NEW.DataConsulta;
    
    IF disponibilidade > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Médico não disponível nesta data e hora';
    END IF;
END;
//

DELIMITER ;
```
## Explicação:

AtualizarHistoricoConsultas é um placeholder que pode ser usado para ações após a inserção de uma nova consulta.
  
VerificarDisponibilidadeMedico impede a inserção de uma consulta se o médico não estiver disponível na data e hora especificadas.
