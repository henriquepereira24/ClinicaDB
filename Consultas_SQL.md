# Consultas SQL

## Estas consultas SQL permitem extrair informações específicas da base de dados:

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

## Explicação:

A primeira consulta lista todos os pacientes atendidos por cada médico.

A segunda consulta lista todas as consultas realizadas dentro de um período específico.

A terceira consulta lista os pacientes que têm mais de um determinado número de consultas.

A quarta consulta lista todos os tratamentos disponíveis.
