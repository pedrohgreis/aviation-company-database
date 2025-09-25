# Gatilho `tr_check_flight_capacity`

## Explicação do Gatilho

- **Objetivo:** Impedir que novas reservas sejam criadas para um voo que já está com a capacidade máxima preenchida.
- **Quando é acionado:** O gatilho é disparado `BEFORE INSERT` (antes de uma inserção) na tabela `Reserva`.
- **O que ele faz:**
    1.  Antes de uma nova reserva ser inserida, o gatilho obtém o `id_Aviao` correspondente ao `idVoo` da nova reserva.
    2.  Com o `id_Aviao`, ele consulta a capacidade máxima de passageiros na tabela `Aviao`.
    3.  Conta o número de reservas já existentes para aquele `idVoo`.
    4.  Compara o número de reservas atuais com a capacidade do avião.
    5.  Se o número de reservas for igual ou maior que a capacidade, a operação de `INSERT` é cancelada e uma mensagem de erro é retornada.

## Utilidade

- **Integridade dos Dados:** Garante que a regra de negócio de não vender mais assentos do que o disponível seja sempre cumprida no nível do banco de dados.
- **Prevenção de Erros:** Evita overbooking e os problemas operacionais e de atendimento ao cliente que isso causaria.
