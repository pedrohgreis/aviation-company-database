-- -------------------------------------------------------------------
-- 1. PREPARAÇÃO DO CENÁRIO DE TESTE
-- Usamos `INSERT IGNORE` para criar os dados apenas se eles não
-- existirem, evitando erros de chave duplicada em execuções futuras.
-- -------------------------------------------------------------------

-- Garante que o passageiro de teste exista
INSERT IGNORE INTO pessoa (id, primeiro_nome, sobrenome, DataNasc)
VALUES (1, 'Ana', 'Silva', '1990-05-15');

-- Garante que o passageiro seja um cliente
INSERT IGNORE INTO cliente (idPessoa, email, plano)
VALUES (1, 'ana.silva@example.com', 'PREMIUM');

-- Garante que os dados de infraestrutura do voo existam
INSERT IGNORE INTO Aviao (id_aviao, modelo, fabricante)
VALUES (1, 'Airbus A320', 'Airbus');

INSERT IGNORE INTO Cidade (id_cidade, nome, pais)
VALUES (1, 'São Paulo', 'Brasil'), (2, 'Rio de Janeiro', 'Brasil');

INSERT IGNORE INTO Status_voo (id_status, nome, descricao)
VALUES (1, 'Confirmado', 'O voo está confirmado e programado.');

-- Garante que o voo de teste exista
INSERT IGNORE INTO Voo (id_voo, distancia, duracao, id_Aviao, id_cidade_origem, id_cidade_destino, id_status_voo)
VALUES (101, 430, '01:00:00', 1, 1, 2, 1);

-- Mensagem de status
SELECT 'Cenário de teste garantido. Cliente ID=1 e Voo ID=101 estão prontos.' AS status;


-- -------------------------------------------------------------------
-- 2. PRIMEIRO TESTE: Inserção Válida
-- Garantimos que a reserva exista. Se o script já rodou,
-- esta linha será ignorada sem erro.
-- -------------------------------------------------------------------

INSERT IGNORE INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva)
VALUES (101, 1, '15A', 'XYZ789', CURDATE());

-- Verificando se a reserva está lá (ela sempre estará após esta etapa)
SELECT * FROM Reserva WHERE idVoo = 101 AND id_cliente = 1;

-- Mensagem de status
SELECT 'SUCESSO: A primeira reserva foi garantida no banco de dados.' AS resultado_teste_1;


-- -------------------------------------------------------------------
-- 3. SEGUNDO TESTE: Tentativa de Inserção Duplicada
--
-- IMPORTANTE: Aqui, usamos um `INSERT` normal, SEM o `IGNORE`.
-- O objetivo desta etapa é testar o trigger, então nós PRECISAMOS
-- que a tentativa de inserção aconteça e falhe, gerando o erro
-- esperado do nosso trigger ou da chave primária.
-- -------------------------------------------------------------------

-- A linha abaixo DEVE gerar um erro com a mensagem:
-- "Error Code: 1644. Erro: O passageiro já possui uma reserva para este voo."
INSERT INTO Reserva (idVoo, id_cliente, poltrona, numReserva, dataReserva)
VALUES (101, 1, '22B', 'ABC123', CURDATE());