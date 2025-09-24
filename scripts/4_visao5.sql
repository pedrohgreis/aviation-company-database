CREATE VIEW vw_Horario_Voos_Detalhado AS
SELECT
    v.id_voo,
    origem.nome AS cidade_origem,
    destino.nome AS cidade_destino,
    v.duracao,
    a.modelo AS modelo_aviao,
    s.nome AS status_voo
FROM
    Voo v
JOIN
    Cidade origem ON v.id_cidade_origem = origem.id_cidade
JOIN
    Cidade destino ON v.id_cidade_destino = destino.id_cidade
JOIN
    Aviao a ON v.id_Aviao = a.id_aviao
JOIN
    Status_voo s ON v.id_status_voo = s.id_status;
