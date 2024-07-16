# Inserção de Dados de Exemplo
## Este script insere dados de exemplo nas tabelas criadas:

```bash
-- Inserir dados em Pacientes
INSERT INTO Pacientes (Nome, DataNascimento, Telefone) VALUES
('João da Silva', '1980-05-15', '919999999'),
('Maria Oliveira', '1990-07-20', '929888888');

-- Inserir dados em Médicos
INSERT INTO Médicos (Nome, Especialidade) VALUES
('Dr. Pedro Santos', 'Cardiologia'),
('Dra. Ana Costa', 'Dermatologia');

-- Inserir dados em Consultas
INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico) VALUES
(1, 1, '2023-09-02 10:00:00', 'Dor no peito'),
(2, 2, '2023-09-03 11:00:00', 'Alergia');

-- Inserir dados em Tratamentos
INSERT INTO Tratamentos (Nome, Descrição, Preço) VALUES
('Antibiótico', 'Tratamento para infecções bacterianas', 50.00),
('Anti-histamínico', 'Medicamento para alergias', 30.00);

-- Inserir dados em Prescrições
INSERT INTO Prescrições (ConsultaID, TratamentoID, Quantidade, Preço) VALUES
(1, 1, 1, 50.00),
(2, 2, 2, 60.00);
```
