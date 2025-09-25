# Demonstração do Trigger `tg_LogDeStatusDoVoo`

Este script (`tg_LogDeStatusDoVooDEMO.sql`) serve para demonstrar e testar o funcionamento do trigger `tg_LogDeStatusDoVoo`.

## Objetivo

O objetivo é provar que o trigger está registrando corretamente cada mudança de status de um voo na tabela `Log_Status_Voo`.

## Como Funciona

O script segue uma lógica de "Antes, Ação, Depois" para mostrar o impacto do trigger de forma clara.

### 1. Preparação

- **`USE flyBase;`**: Garante que todos os comandos serão executados no banco de dados correto.
- **Inserção de Dados Mínimos**: O script insere dados essenciais para o teste, como os diferentes status de voo (`AGENDADO`, `EM VOO`, etc.), uma cidade, um avião e, finalmente, um voo de teste (`id_voo = 1`) com o status inicial 'AGENDADO'.
- **`INSERT IGNORE`**: Este comando é usado para evitar erros caso os dados já existam, tornando o script executável várias vezes sem problemas.

### 2. Demonstração

#### a. Estado ANTES

- O script primeiro consulta a tabela `Log_Status_Voo` para mostrar que, inicialmente, não há nenhum registro de log para o voo de teste.
- Em seguida, ele verifica e exibe o status atual do voo, que deve ser 'AGENDADO'.

#### b. A Ação (Ativação do Trigger)

- O comando `UPDATE Voo SET id_status_voo = 2 WHERE id_voo = 1;` é executado.
- Esta é a ação principal: ele altera o status do voo de 'AGENDADO' para 'EM VOO'.
- **É neste momento que o trigger `tg_LogDeStatusDoVoo` é disparado automaticamente pelo banco de dados.**

#### c. Estado DEPOIS

- Após o `UPDATE`, o script consulta novamente a tabela `Log_Status_Voo`.
- Desta vez, ele deve encontrar um novo registro que documenta a mudança:
  - `id_voo`: 1
  - `id_status_antigo`: 1 (AGENDADO)
  - `id_status_novo`: 2 (EM VOO)
  - `data_modificacao`: A data e hora em que a alteração ocorreu.
- O script executa a consulta de duas formas: uma mostrando os IDs e outra mais legível, mostrando os nomes dos status.

## Como Usar

1.  Certifique-se de que o trigger `tg_LogDeStatusDoVoo` já foi criado no banco de dados `flyBase`.
2.  Execute o conteúdo deste script (`tg_LogDeStatusDoVooDEMO.sql`) em um cliente SQL (como MySQL Workbench, DBeaver, ou terminal).

## Resultado Esperado

Ao final da execução, você verá nas tabelas de resultado que a tabela `Log_Status_Voo` continha um novo registro para o `id_voo = 1`, provando que o trigger funcionou como esperado.
