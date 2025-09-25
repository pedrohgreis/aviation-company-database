# Visão `detalheReservaCliente`

## Explicação da Visão

- **Objetivo:** Consolidar em uma única consulta todos os detalhes relevantes de um cliente e sua reserva. É uma visão focada em fornecer um perfil completo para operações de atendimento ao cliente ou check-in.
- **Operações usadas:**
    - **Junção (JOIN):** Combina dados de `cliente`, `pessoa`, `telefone_pessoa`, `passaporte` e `Reserva` para criar um registro unificado.
    - **Projeção (PROJECTION):** Seleciona os campos mais importantes de cada tabela, como nome, contato, dados do passaporte e detalhes da reserva.

## Utilidade

- **Atendimento ao Cliente:** Permite que a equipe de suporte visualize rapidamente todas as informações de um cliente que fez uma reserva, agilizando o atendimento.
- **Check-in:** Facilita o processo de check-in, pois todos os dados do passageiro e da reserva estão disponíveis em um só lugar.
- **Confirmação de Dados:** Simplifica a verificação e validação dos dados do cliente e da sua reserva.

## Exemplo de Uso

Para ver os detalhes de todas as reservas de clientes, você pode usar:

```sql
SELECT * FROM detalheReservaCliente;
```

Para encontrar os detalhes de uma reserva específica pelo número da reserva:

```sql
SELECT * FROM detalheReservaCliente WHERE numReserva = 'SEUNUMERORESERVA';
```