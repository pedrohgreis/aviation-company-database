-- Usando o banco de dados do projeto
USE flyBase;

-- ===================================================================
-- PASSO 1: PREPARAÇÃO - INSERIR DADOS MÍNIMOS PARA O TESTE
-- (Você pode pular esta parte se já tiver esses dados no seu banco)
-- ===================================================================

-- Garante que temos os status de voo necessários.
-- O 'INSERT IGNORE' evita erros se os status já existirem.
INSERT IGNORE INTO Status_voo (id_status, nome, descricao) VALUES
(1, 'AGENDADO', 'Voo está agendado e aguardando decolagem'),
(2, 'EM VOO', 'Voo em andamento'),
(3, 'CONCLUIDO', 'Voo finalizado com sucesso'),
(4, 'CANCELADO', 'Voo cancelado antes da decolagem');

-- Garante que temos uma cidade e um avião para criar um voo.
INSERT IGNORE INTO Cidade (id_cidade, nome, pais) VALUES (1, 'Cuiabá', 'Brasil');
INSERT IGNORE INTO Aviao (id_aviao, modelo, fabricante) VALUES (1, 'A320', 'Airbus');

-- Garante que temos um voo para testar.
-- Ele será criado com o status 'AGENDADO' (id_status_voo = 1).
INSERT IGNORE INTO Voo (id_voo, distancia, duracao, id_Aviao, id_cidade_origem, id_cidade_destino, id_status_voo)
VALUES (1, 900, '01:30:00', 1, 1, 1, 1);


-- ===================================================================
-- PASSO 2: O TESTE - DEMONSTRAÇÃO DO TRIGGER
-- Agora vamos executar a sequência "Antes e Depois".
-- ===================================================================

-- 1. Verificando o estado ANTES da operação
-- -------------------------------------------------------------------
SELECT '--- ESTADO ANTES ---' AS 'Demonstração';

-- A tabela de log deve estar vazia (ou sem registros para o voo 1).
SELECT 'Tabela de Log:' AS 'Conteúdo';
SELECT * FROM Log_Status_Voo WHERE id_voo = 1;

-- O voo 1 deve estar com o status 'AGENDADO'.
SELECT 'Status Atual do Voo 1:' AS 'Conteúdo';
SELECT v.id_voo, s.nome AS status_atual 
FROM Voo v JOIN Status_voo s ON v.id_status_voo = s.id_status 
WHERE v.id_voo = 1;


-- 2. A AÇÃO - O comando que ATIVA O TRIGGER
-- -------------------------------------------------------------------
-- Vamos atualizar o status do Voo 1 de 'AGENDADO' (ID 1) para 'EM VOO' (ID 2).
-- Este UPDATE vai disparar o trigger tg_LogDeStatusDoVoo.
UPDATE Voo SET id_status_voo = 2 WHERE id_voo = 1;


-- 3. Verificando o estado DEPOIS da operação
-- -------------------------------------------------------------------
SELECT '--- ESTADO DEPOIS ---' AS 'Demonstração';

-- A tabela de log agora deve ter um registro da mudança.
SELECT 'Tabela de Log (com IDs):' AS 'Conteúdo';
SELECT * FROM Log_Status_Voo WHERE id_voo = 1;

-- Para uma visualização mais clara, usamos o JOIN para ver os nomes.
SELECT 'Tabela de Log (com Nomes):' AS 'Conteúdo';
SELECT 
    l.id_voo,
    s_antigo.nome AS status_de,
    s_novo.nome AS status_para,
    l.data_modificacao
FROM 
    Log_Status_Voo AS l
LEFT JOIN 
    Status_voo AS s_antigo ON l.id_status_antigo = s_antigo.id_status
LEFT JOIN 
    Status_voo AS s_novo ON l.id_status_novo = s_novo.id_status
WHERE l.id_voo = 1;
