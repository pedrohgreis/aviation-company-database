USE flyBase

CREATE VIEW vw_planos_clientes AS
SELECT
    p.primeiro_nome,
    p.sobrenome,
    c.email,
    c.plano
FROM
    cliente c
JOIN
    pessoa p ON c.idPessoa = p.id;