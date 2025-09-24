USE flyBase

CREATE VIEW voosComAtraso
AS SELECT 
    v.id_voo,
    s.nome,
    s.descricao,
    c.nome,
    c.pais

FROM Voo v 
INNER JOIN Status_voo s ON v.id_status_voo = s.id_status
INNER JOIN Cidade c ON v.id_cidade_origem = id_cidade
WHERE s.nome = 'Atrasado';