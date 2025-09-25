# Demonstração do Gatilho `tr_check_flight_capacity`

## Explicação do Script de Demonstração

- **Objetivo:** Provar que o gatilho `tr_check_flight_capacity` funciona corretamente, impedindo a sobrelotação de um voo.

- **Como funciona:**
    1.  **Preparação:** O script foca no voo de `id_voo = 3`, que utiliza um avião com capacidade para 8 passageiros. Ele primeiro visualiza a capacidade do avião e o número de reservas existentes.
    2.  **Inserção de Dados:** Para o teste, são criados clientes e pessoas fictícias.
    3.  **Ativação do Gatilho:** O script então insere reservas uma a uma para o voo 3 até atingir a capacidade máxima (8 reservas).
    4.  **Teste Final:** A última instrução `INSERT` tenta adicionar a 9ª reserva. Neste ponto, o gatilho `tr_check_flight_capacity` é acionado, a operação falha, e o banco de dados retorna a mensagem de erro definida no gatilho: `Não é possível criar a reserva. O voo já atingiu a capacidade máxima.`.

## Utilidade

- **Verificação:** Serve como um teste prático e documentado para validar a lógica do gatilho `tr_check_flight_capacity`.
- **Documentação Viva:** Demonstra de forma clara como o gatilho se comporta em um cenário real, o que é útil para desenvolvedores e administradores de banco de dados entenderem as regras do sistema.
