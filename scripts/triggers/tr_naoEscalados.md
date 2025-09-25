# Gatilho `tr_naoEscalados`

## Explicação do Gatilho

- **Objetivo:** Registrar funcionários demitidos em uma lista de "não escaláveis", provavelmente para impedir que sejam acidentalmente designados a novas tarefas.
- **Quando é acionado:** O gatilho é disparado `AFTER INSERT` (após uma inserção) na tabela `funcionariosDemitidos`.
- **O que ele faz:**
    1.  Sempre que um novo registro de um funcionário demitido é inserido na tabela `funcionariosDemitidos`, este gatilho é acionado.
    2.  Ele pega o `id` do registro recém-inserido na tabela `funcionariosDemitidos` e a `dataDesligamento`.
    3.  Insere essas informações na tabela `funcionariosNaoEscalados`.

## Utilidade

- **Controle de Acesso Lógico:** Funciona como um passo adicional de segurança para garantir que, uma vez que um funcionário é movido para a tabela de demitidos, ele seja automaticamente adicionado a uma lista que o impede de ser escalado para voos ou outras atividades.
- **Separação de Responsabilidades:** Enquanto `funcionariosDemitidos` é um arquivo histórico de RH, `funcionariosNaoEscalados` parece ser uma tabela operacional para o sistema de escalonamento, garantindo que apenas pessoal ativo seja considerado.
