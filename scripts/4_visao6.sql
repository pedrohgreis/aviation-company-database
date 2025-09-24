DROP VIEW IF EXISTS historicoPassageiro;

CREATE VIEW historicoPassageiro AS
SELECT
    -- Identificação do Passageiro
    p.id AS id_passageiro,
    p.primeiro_nome,
    p.sobrenome,
    c.email,

    -- Detalhes da Reserva
    r.numReserva AS numero_reserva,
    r.poltrona,
    r.dataReserva AS data_reserva,

    -- Detalhes do Voo
    v.id_voo,
    origem.nome AS cidade_origem,
    destino.nome AS cidade_destino,
    v.duracao,
    v.distancia,

    -- Detalhes Adicionais
    av.modelo AS modelo_aviao,
    sv.nome AS status_voo

FROM
    Reserva AS r
    -- Junta a reserva com o cliente
    JOIN cliente AS c ON r.id_cliente = c.idPessoa
    -- Junta o cliente com a pessoa para obter o nome
    JOIN pessoa AS p ON c.idPessoa = p.id
    -- Junta a reserva com o voo para obter os detalhes do voo
    JOIN Voo AS v ON r.idVoo = v.id_voo
    -- Junta o voo com a cidade de origem (usando um alias 'origem')
    JOIN Cidade AS origem ON v.id_cidade_origem = origem.id_cidade
    -- Junta o voo com a cidade de destino (usando um alias 'destino')
    JOIN Cidade AS destino ON v.id_cidade_destino = destino.id_cidade
    -- Junta o voo com o avião para obter o modelo
    JOIN Aviao AS av ON v.id_Aviao = av.id_aviao
    -- Junta o voo com o status para obter a descrição
    JOIN Status_voo AS sv ON v.id_status_voo = sv.id_status

ORDER BY
    p.id, r.dataReserva DESC;
