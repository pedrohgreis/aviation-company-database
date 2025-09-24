USE flyBase;

-- =================================================================================
-- DEMONSTRAÇÃO DO GATILHO: `tr_check_flight_capacity`
--
-- Objetivo: Provar que o gatilho impede a criação de reservas em um voo lotado.
-- Voo de Teste: Voo com id_voo = 3.
-- Avião: Embraer Phenom 300 (id_aviao = 6), com capacidade para 8 passageiros.
-- =================================================================================

-- ---------------------------------------------------------------------------------
-- ETAPA 1: VISUALIZAÇÃO DO "ANTES"
-- ---------------------------------------------------------------------------------

-- Consulta 1: Verificando a capacidade máxima do avião do voo 3.
SELECT 
    a.modelo,
    a.capacidade
FROM Aviao a
JOIN Voo v ON a.id_aviao = v.id_Aviao
WHERE v.id_voo = 3;

-- Consulta 2: Contando quantas reservas já existem para o voo 3.
-- (O script 2_popular.sql já insere 2 reservas para este voo)
SELECT 
    COUNT(*) AS reservas_atuais
FROM Reserva
WHERE idVoo = 3;

-- ---------------------------------------------------------------------------------
-- ETAPA 2: ATIVANDO O GATILHO (TENTATIVA DE SOBRELOTAÇÃO)
-- ---------------------------------------------------------------------------------

-- Para o teste funcionar, precisamos primeiro inserir pessoas e clientes de teste.
INSERT INTO pessoa (id, primeiro_nome, sobrenome, DataNasc, genero) VALUES
(11, 'Teste1', 'Trig', '2000-01-01', 'M'),
(12, 'Teste2', 'Trig', '2000-01-01', 'F'),
(13, 'Teste3', 'Trig', '2000-01-01', 'M'),
(14, 'Teste4', 'Trig', '2000-01-01', 'F'),
(15, 'Teste5', 'Trig', '2000-01-01', 'M'),
(16, 'Teste6', 'Trig', '2000-01-01', 'F'),
(17, 'Teste7', 'Trig', '2000-01-01', 'M');

INSERT INTO cliente (idPessoa, email, plano) VALUES
(11, 'teste1@email.com', 'BASICO'),
(12, 'teste2@email.com', 'BASICO'),
(13, 'teste3@email.com', 'BASICO'),
(14, 'teste4@email.com', 'BASICO'),
(15, 'teste5@email.com', 'BASICO'),
(16, 'teste6@email.com', 'BASICO'),
(17, 'teste7@email.com', 'BASICO');

-- Agora, as reservas. Vamos preencher o avião.
-- Inserindo a 3ª reserva (deve funcionar)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 11, 'A1', 'RES_T1', CURDATE());
-- Inserindo a 4ª reserva (deve funcionar)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 12, 'A2', 'RES_T2', CURDATE());
-- Inserindo a 5ª reserva (deve funcionar)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 13, 'A3', 'RES_T3', CURDATE());
-- Inserindo a 6ª reserva (deve funcionar)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 14, 'A4', 'RES_T4', CURDATE());
-- Inserindo a 7ª reserva (deve funcionar)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 15, 'A5', 'RES_T5', CURDATE());
-- Inserindo a 8ª reserva (deve funcionar, atingindo a capacidade máxima)
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 16, 'A6', 'RES_T6', CURDATE());

-- TENTATIVA FINAL: Inserindo a 9ª reserva.
-- Esta operação DEVE FALHAR e retornar a mensagem de erro do gatilho.
-- O MySQL irá parar a execução do script aqui e mostrar o erro.
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva) VALUES (3, 17, 'A7', 'RES_T7', CURDATE());


-- ---------------------------------------------------------------------------------
-- ETAPA 3: VISUALIZAÇÃO DO "DEPOIS"
-- ---------------------------------------------------------------------------------

-- Esta consulta só será executada se a inserção que falha for comentada ou removida.
-- Ela serve para provar que o número de reservas não ultrapassou a capacidade.
SELECT 
    COUNT(*) AS reservas_depois_do_teste
FROM Reserva
WHERE idVoo = 3;