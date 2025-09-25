USE flyBase;

-- =====================
-- AVIÕES (10 registros)
-- =====================
INSERT INTO Aviao (modelo, fabricante, data_aquisicao, capacidade) VALUES
('Embraer E195-E2', 'Embraer', '2021-03-10', 132),
('Boeing 787-9 Dreamliner', 'Boeing', '2019-11-05', 290),
('Bombardier CRJ900', 'Bombardier', '2017-07-30', 76),
('ATR 72-600', 'ATR', '2016-04-12', 70),
('Airbus A330-300', 'Airbus', '2014-08-18', 300),
('Embraer Phenom 300', 'Embraer', '2023-05-01', 8),
('Airbus A220-300', 'Airbus', '2020-12-07', 130),
('Boeing 737 MAX 8', 'Boeing', '2018-09-25', 180),
('Airbus A350-900', 'Airbus', '2022-01-15', 350),
('Cessna Citation X', 'Cessna', '2015-11-03', 12);

-- =====================
-- CIDADES (10 registros)
-- =====================
INSERT INTO Cidade (nome, pais) VALUES
('Santa Catarina', 'Brasil'),
('São Paulo', 'Brasil'),
('Campo Grande', 'Brasil'),
('Salvador', 'Brasil'),
('Buenos Aires', 'Argentina'),
('Cancún', 'México'),
('San Pedro de Atacama', 'Chile'),
('Machu Picchu', 'Peru'),
('Maceió', 'Brasil'),
('Fernando de Noronha', 'Brasil');

-- =====================
-- CARGOS (10 registros)
-- =====================
INSERT INTO cargo (nomeCargo, salario) VALUES
('Gerente', 8000.00),
('Analista', 5000.00),
('Assistente', 3000.00),
('Estagiario', 1500.00),
('Diretor', 12000.00),
('Piloto', 15000.00),
('Copiloto', 10000.00),
('Aeromoça', 7000.00),
('Comissário de Bordo', 7000.00),
('Supervisor', 9000.00);

-- =====================
-- PESSOAS (10 registros iniciais)
-- =====================
INSERT INTO pessoa (primeiro_nome, sobrenome, DataNasc, genero) VALUES
('João', 'Silva', '1985-03-10', 'M'),
('Maria', 'Oliveira', '1990-07-22', 'F'),
('Carlos', 'Santos', '1978-11-15', 'M'),
('Ana', 'Costa', '1992-01-05', 'F'),
('Lucas', 'Pereira', '1988-09-30', 'M'),
('Julia', 'Almeida', '1995-12-12', 'F'),
('Pedro', 'Souza', '1983-06-18', 'M'),
('Fernanda', 'Lima', '1991-04-25', 'F'),
('Rafael', 'Barbosa', '1987-08-14', 'M'),
('Patricia', 'Mendes', '1993-10-02', 'F');

-- =====================
-- CLIENTES (10 registros relacionados às pessoas acima)
-- =====================
INSERT INTO cliente (idPessoa, email, plano) VALUES
(1, 'joao.silva1@email.com', 'BASICO'),
(2, 'maria.oliveira2@email.com', 'PREMIUM'),
(3, 'carlos.santos3@email.com', 'VIP'),
(4, 'ana.costa4@email.com', 'BASICO'),
(5, 'lucas.pereira5@email.com', 'PREMIUM'),
(6, 'julia.almeida6@email.com', 'VIP'),
(7, 'pedro.souza7@email.com', 'BASICO'),
(8, 'fernanda.lima8@email.com', 'PREMIUM'),
(9, 'rafael.barbosa9@email.com', 'VIP'),
(10, 'patricia.mendes10@email.com', 'BASICO');

-- =====================
-- TELEFONES (10 registros relacionados às pessoas)
-- =====================
INSERT INTO telefone_pessoa (idPessoa, numero_telefone) VALUES
(1, '11999990001'), (2, '21999990002'), (3, '31999990003'), 
(4, '41999990004'), (5, '51999990005'),
(6, '61999990006'), (7, '71999990007'), 
(8, '81999990008'), (9, '91999990009'), (10, '11999990010');

-- =====================
-- PASSAPORTES (10 registros relacionados aos clientes)
-- =====================
INSERT INTO passaporte (idCliente, numPassaporte, paisEmissor, dataEmissao, dataExpiracao) VALUES
(1, 'PBR123456', 'Brasil', '2015-01-01', '2025-01-01'),
(2, 'PUS654321', 'Estados Unidos', '2016-02-02', '2026-02-02'),
(3, 'PFR789012', 'França', '2017-03-03', '2027-03-03'),
(4, 'PDE345678', 'Alemanha', '2018-04-04', '2028-04-04'),
(5, 'PJP901234', 'Japão', '2019-05-05', '2029-05-05'),
(6, 'PBR234567', 'Brasil', '2015-06-06', '2025-06-06'),
(7, 'PUS765432', 'Estados Unidos', '2016-07-07', '2026-07-07'),
(8, 'PFR890123', 'França', '2017-08-08', '2027-08-08'),
(9, 'PDE456789', 'Alemanha', '2018-09-09', '2028-09-09'),
(10, 'PJP012345', 'Japão', '2019-10-10', '2029-10-10');

-- =====================
-- STATUS VOO (necessário para FK de Voo)
-- =====================
INSERT INTO Status_voo (nome, descricao) VALUES
('AGENDADO', 'Voo está agendado e aguardando decolagem'),
('EM VOO', 'Voo em andamento'),
('CONCLUIDO', 'Voo finalizado com sucesso'),
('CANCELADO', 'Voo cancelado antes da decolagem');

-- =====================
-- VOOS (5 registros)
-- =====================
INSERT INTO Voo (distancia, duracao, id_Aviao, id_cidade_origem, id_cidade_destino, id_status_voo) VALUES
(6900, '08:40:00', 3, 2, 6, 1), -- São Paulo -> Cancún
(2200, '02:55:00', 10, 3, 9, 1), -- Campo Grande -> Maceió
(1700, '02:50:00', 6, 2, 5, 1), -- São Paulo -> Buenos Aires
(1200, '02:30:00', 5, 4, 10, 1), -- Salvador -> Fernando de Noronha
(1450, '02:10:00', 1, 2, 4, 1); -- São Paulo -> Salvador

-- =====================
-- RESERVAS (10 registros)
-- =====================
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES
(1, 1, '1A', 'RES001', '2023-09-01'),
(2, 2, '2B', 'RES002', '2023-09-02'),
(3, 3, '3C', 'RES003', '2023-09-03'),
(4, 4, '4D', 'RES004', '2023-09-04'),
(5, 5, '5E', 'RES005', '2023-09-05'),
(1, 6, '6A', 'RES006', '2023-09-06'),
(2, 7, '7B', 'RES007', '2023-09-07'),
(3, 8, '8C', 'RES008', '2023-09-08'),
(4, 9, '9D', 'RES009', '2023-09-09'),
(5, 10, '10E', 'RES010', '2023-09-10');