# Visão `PassageirosdoVoo`

## Explicação da visão

- O objetivo principal aqui é criar uma lista de embarque (ou manifesto) para um voo específico. A view deve responder à pergunta: "Quem são as pessoas que estão no voo X e em quais assentos elas estão sentadas?".

- A view começa pela tabela Reserva, que é a ligação central entre um cliente e um voo. Ela se junta à tabela cliente para identificar o cliente. Depois, ela se junta à tabela pessoa para obter o nome completo do passageiro.Ela também pode se juntar à tabela passaporte para incluir o número do documento, informação importante para voos internacionais.

- SELECT * FROM vw_PassageirosPorVoo WHERE idVoo = 1;