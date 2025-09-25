# Gatilho `tg_LogDeStatusDoVoo`

## Explicação do Gatilho

- **Objetivo:** Manter um histórico de todas as mudanças de status de um voo.
- **Quando é acionado:** O gatilho é disparado `AFTER UPDATE` (após uma atualização) na tabela `Voo`.
- **O que ele faz:**
    1.  Verifica se o `id_status_voo` foi alterado.
    2.  Se o status mudou, ele busca o nome do status antigo e do novo status na tabela `Status_voo`.
    3.  Insere um novo registro na tabela `Log_Status_Voo` com o `id_voo`, o `status_antigo` e o `status_novo`.

## Utilidade

- **Auditoria:** Permite rastrear o que aconteceu com um voo (e.g., "Quando o voo X foi de 'Programado' para 'Atrasado'?").
- **Análise de Desempenho:** Ajuda a identificar gargalos ou problemas operacionais, analisando com que frequência e por que os voos mudam de status.
