# Gatilho `tr_funcionariosDemitidos`

## Explicação do Gatilho

- **Objetivo:** Arquivar informações de funcionários que são desligados da empresa.
- **Quando é acionado:** O gatilho é disparado `AFTER INSERT` (após uma inserção) na tabela `funcionario`.
- **O que ele faz:**
    1.  Após um novo registro ser inserido na tabela `funcionario`, o gatilho verifica o valor da coluna `atividade`.
    2.  Se o valor for "Desligado", ele insere os dados relevantes desse funcionário (como `id_pessoa`, `id_cargo`, data de ingresso e desligamento) em uma tabela de histórico chamada `funcionariosDemitidos`.

## Utilidade

- **Manutenção de Histórico:** Cria um registro separado de todos os funcionários que já foram desligados, permitindo que a tabela `funcionario` contenha apenas os funcionários ativos, se desejado.
- **Análise de RH:** Facilita a análise de rotatividade (turnover) e outros relatórios relacionados a recursos humanos sem a necessidade de consultar a tabela principal de funcionários e filtrar pelos desligados.
