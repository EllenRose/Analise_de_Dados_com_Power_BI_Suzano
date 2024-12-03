------------ Inserção de dados

INSERT INTO Cliente (nome,CPF, Endereco, telefone,Email, tipo_cliente) VALUES
('Maria Donizete','789456123' 'Rua 25 de marco, 582', '123456789', 'mariadonizete@email.com','PF'),
('Oficina do Joaquim','123456789456321', 'Rua das lobelias, 333', '987654321','jooficina@email.com', 'PJ');

INSERT INTO Veiculo (placa, modelo, ano,cor, id_cliente) VALUES
('ABC4567', 'JEEP', 2019,'Preto', 1),
('DEF7896', 'UNO', 2018,'Vermelho', 2);

INSERT INTO Mecanico (nome, especialidade,Admissao) VALUES
('Henrique', 'Pintura', '2020-01-01'),
('Jonas', 'Freios', '2021-02-02');


INSERT INTO OrdemServico (numero,data_emissao,data_conclusao, valor_total, status,tipo,id_veiculo, id_cliente) VALUES
('1','2024-01-01','2024-02-02', 98.00, 'Em andamento','2', 1, 1),
('2','2024-02-02','2024-03-02', 50.00, 'Concluído','3', 2, 2);

----Queries

SELECT * FROM Cliente;
SELECT * FROM Veiculo;
SELECT * FROM OrdemServico WHERE status = 'Concluído';
SELECT * FROM Mecanico ORDER BY nome ASC;
