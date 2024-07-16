# 1.Testar Consultas

```bash
-- Listar todos os pacientes atendidos por cada médico
SELECT Médicos.Nome AS Médico, Pacientes.Nome AS Paciente
FROM Consultas
JOIN Médicos ON Consultas.MédicoID = Médicos.ID
JOIN Pacientes ON Consultas.PacienteID = Pacientes.ID;

-- Listar as consultas realizadas num determinado período
SELECT *
FROM Consultas
WHERE DataConsulta BETWEEN '2023-07-01' AND '2023-08-31';

-- Listar os pacientes com mais de um determinado número de consultas
SELECT Pacientes.Nome, COUNT(Consultas.ID) AS NumConsultas
FROM Consultas
JOIN Pacientes ON Consultas.PacienteID = Pacientes.ID
GROUP BY Pacientes.Nome
HAVING NumConsultas > 1;

-- Listar os tratamentos disponíveis
SELECT * FROM Tratamentos;
```
# 2.Testar Triggers
Para testar o trigger AtualizarHistoricoConsultas:

```bash
INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
VALUES (1, 1, '2023-09-15 10:00:00', 'Dor de estômago');

-- Verificar o histórico de consultas
SELECT * FROM ClinicaDB.Consultas;
```
Para testar o trigger VerificarDisponibilidadeMedico, tente inserir uma consulta no mesmo horário para o mesmo médico:

```bash
INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
VALUES (2, 1, '2023-09-01 10:00:00', 'Alergia');
```
# 3.Testar Stored Procedures

Para testar a stored procedure RegistrarConsulta:
```bash
CALL RegistrarConsulta(2, 2, '2023-09-02 11:00:00', 'Dor de cabeça');

-- Verificar se a consulta foi registrada
SELECT * FROM Consultas WHERE DataConsulta = '2023-09-02 11:00:00';
```
Para testar a stored procedure AtualizarPaciente:

```bash
CALL AtualizarPaciente(1, 'João da Silva', '1980-05-15', '919992199');

-- Verificar se os dados do paciente foram atualizados
SELECT * FROM Pacientes WHERE ID = 1;
```
Para testar a stored procedure TotalConsultas:

```bash
CALL TotalConsultas('2023-07-01', '2023-09-30', @total);
SELECT @total AS TotalConsultas;
```
# 4.Testar Cursores

Para testar a stored procedure RelatorioPacientesConsultas:

```bash
CALL RelatorioPacientesConsultas('2023-07-01', '2023-08-31');
```

