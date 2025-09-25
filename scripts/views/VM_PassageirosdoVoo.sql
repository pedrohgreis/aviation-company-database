USE flyBase

CREATE VIEW vw_PassageirosPorVoo AS /*liste os passageiros do voo*/
SELECT
    r.idVoo AS ID_Voo,
    CONCAT(p.primeiro_nome, ' ', p.sobrenome) AS Nome_Completo_Passageiro,
    r.poltrona AS Assento,
    r.numReserva AS Codigo_Reserva,
    pass.numPassaporte AS Numero_Passaporte,
    p.DataNasc AS Data_Nascimento
FROM
    Reserva AS r
INNER JOIN
    cliente AS c ON r.id_cliente = c.idPessoa
INNER JOIN
    pessoa AS p ON c.idPessoa = p.id
LEFT JOIN
    passaporte AS pass ON c.idPessoa = pass.idCliente
ORDER BY
    r.idVoo, Nome_Completo_Passageiro;