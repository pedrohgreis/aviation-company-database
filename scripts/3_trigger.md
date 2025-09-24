# Gatilho: Verificação de Capacidade do Voo (`tr_check_flight_capacity`)

## Regra de Negócio

A principal regra de negócio implementada por este gatilho é:

**"Um voo não pode ser sobrelotado (overbooked). O sistema deve impedir que novas reservas sejam criadas para um voo que já atingiu sua capacidade máxima de assentos."**

Este é um requisito fundamental para qualquer companhia aérea para garantir a segurança, a conformidade com as regulamentações e a satisfação do cliente.

## Como o Gatilho Funciona

O gatilho `tr_check_flight_capacity` é acionado automaticamente **antes** que uma nova linha seja inserida na tabela `Reserva`.

O processo executado pelo gatilho é o seguinte:

1.  **Identifica o Voo e o Avião:** Para a nova reserva que está sendo tentada, o gatilho primeiro consulta a tabela `Voo` para descobrir qual avião (`id_Aviao`) está designado para aquele voo.

2.  **Verifica a Capacidade da Aeronave:** Com o ID do avião, ele consulta a tabela `Aviao` para obter o número máximo de assentos que aquela aeronave suporta (a coluna `capacidade`).

3.  **Conta as Reservas Atuais:** Em seguida, o gatilho faz uma contagem (`SELECT COUNT(*)`) na própria tabela `Reserva` para saber quantos passageiros já estão confirmados para aquele voo.

4.  **Toma a Decisão:** Ele compara o número de reservas atuais com a capacidade do avião:
    *   Se o número de reservas for **menor** que a capacidade, o gatilho permite que a nova reserva seja inserida normalmente.
    *   Se o número de reservas for **igual ou maior** que a capacidade, o gatilho bloqueia a inserção e retorna uma mensagem de erro clara: "Não é possível criar a reserva. O voo já atingiu a capacidade máxima."

Este gatilho cumpre o requisito de usar operações de `SELECT` em múltiplas tabelas (`Voo`, `Aviao`, `Reserva`) para aplicar uma regra de negócio complexa e essencial.
