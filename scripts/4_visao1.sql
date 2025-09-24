USE flyBase;

CREATE VIEW detalheReservaCliente
AS SELECT 
    p.primeiro_nome,
    p.sobrenome,
    p.DataNasc,
    c.email,
    c.plano,
    cel.numero_telefone,
    pass.numPassaporte,
    pass.paisEmissor,
    pass.dataEmissao,
    pass.dataExpiracao,
    r.numReserva,
    r.dataReserva,
    r.poltrona

FROM cliente c 
INNER JOIN pessoa p ON c.idPessoa = p.id
INNER JOIN telefone_pessoa cel ON c.idPessoa = cel.idPessoa
INNER JOIN passaporte pass ON c.idPessoa = pass.idCliente
INNER JOIN Reserva r ON c.idPessoa = id_cliente;




