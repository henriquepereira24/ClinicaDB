# Inserção de Dados de Exemplo
## Este script insere dados de exemplo nas tabelas criadas:

```bash
INSERT INTO Pacientes (Nome, DataNascimento, Telefone)
VALUES
('João Silva', '1980-05-15', '912345678'),
('Maria Oliveira', '1975-10-23', '913456789');

INSERT INTO Médicos (Nome, Especialidade)
VALUES
('Dr. Pedro Costa', 'Cardiologia'),
('Dr. Ana Souza', 'Dermatologia');

INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
VALUES
(1, 1, '2023-07-10 10:00:00', 'Hipertensão'),
(2, 2, '2023-07-11 11:00:00', 'Dermatite');

INSERT INTO Tratamentos (Nome, Descrição, Preço)
VALUES
('Tratamento A', 'Descrição do Tratamento A', 100.00),
('Tratamento B', 'Descrição do Tratamento B', 150.00);

INSERT INTO Prescrições (ConsultaID, TratamentoID, Quantidade, Preço)
VALUES
(1, 1, 1, 100.00),
(2, 2, 2, 300.00);
```
