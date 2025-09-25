# Visão `historicoPassageiro`

## Explicação da Visão

- **Objetivo:** Fornecer um histórico completo de todas as viagens de cada passageiro, combinando informações de várias tabelas em uma única consulta fácil de usar.
- **Operações usadas:**
    - **Junção (JOIN):** Combina dados das tabelas `Reserva`, `cliente`, `pessoa`, `Voo`, `Cidade` (para origem e destino), `Aviao` e `Status_voo`.
    - **Projeção (PROJECTION):** Seleciona e renomeia campos importantes para criar um relatório claro, incluindo detalhes do passageiro, da reserva e do voo.
    - **Ordenação (ORDER BY):** Organiza os resultados por `id_passageiro` e, em seguida, pela `data_reserva` em ordem decrescente, mostrando as viagens mais recentes primeiro para cada passageido.

## Utilidade

- **Atendimento ao Cliente:** Permite que um atendente veja rapidamente todo o histórico de voos de um cliente, facilitando o suporte.
- **Análise de Fidelidade:** Ajuda a identificar clientes frequentes e a entender seus padrões de viagem.
- **Relatórios:** Simplifica a criação de relatórios sobre o histórico de viagens de passageiros sem a necessidade de escrever consultas complexas repetidamente.

## Exemplo de Uso

Para ver o histórico de um passageiro específico (por exemplo, com `id_passageiro = 1`), você pode usar:

```sql
SELECT * FROM historicoPassageiro WHERE id_passageiro = 1;
```
