## Trigger: `tr_demitidos`

O trigger **tr_demitidos** tem o objetivo de cada vez que um funcionário for desligado da empresa, esse mesmo funcionário será registrado em uma tabela chamada `funcionariosDemitidos`. Assim, conseguiremos manter os dados de antigos funcionários.

## Trigger: `tr_funcNaoEscalado`

O trigger **tr_funcNaoEscalado** tem o objetivo de assegurar que cada vez que um funcionário for desligado da empresa ele vá, também, para a tabela `funcionariosNaoEscalados` para que ele já não seja escalado.