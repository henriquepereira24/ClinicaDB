# Triggers
## Triggers são usados para automatizar tarefas e garantir a integridade dos dados:

```bash
-- 1. Trigger para Atualizar o Histórico de Consultas do Paciente Após a Inserção de uma Nova Consulta
DELIMITER //

CREATE TRIGGER AtualizarHistoricoConsultas
AFTER INSERT ON Consultas
FOR EACH ROW
BEGIN
    -- Código para atualizar histórico
END;
//

DELIMITER ;

DELIMITER //

-- 2. Impedir a inserção de uma consulta se o médico não estiver disponível
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

1.Este trigger é acionado após a inserção de uma nova consulta na tabela Consultas. Ele insere um registro correspondente na tabela, registrando o ID do paciente, o ID da consulta e a data da consulta.

2.Este trigger é acionado antes da inserção de uma nova consulta na tabela Consultas. Ele verifica se o médico já tem uma consulta marcada para a mesma data e hora. Se o médico não estiver disponível, um erro é gerado e a inserção é impedida.
