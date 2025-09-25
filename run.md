# Script `run.sh`

## Explicação do Script

- **Objetivo:** Automatizar a inicialização e configuração completa do ambiente do banco de dados do projeto de aviação.

- **Como funciona:**
    1.  **Inicia os Contêineres:** O script começa executando `docker-compose up -d`, que sobe os serviços definidos no arquivo `docker-compose.yml` (neste caso, o banco de dados MySQL) em modo "detached" (em segundo plano).
    2.  **Aguarda o MySQL:** Há uma pausa de 10 segundos (`sleep 10`) para garantir que o serviço do MySQL dentro do contêiner tenha tempo suficiente para iniciar completamente antes de receber comandos.
    3.  **Criação das Tabelas:** Executa o script `inicializar/inicializa_Tables.sql`, que contém os comandos `CREATE TABLE` para definir a estrutura do banco de dados `flyBase`.
    4.  **Criação dos Gatilhos (Triggers):** O script executa, um por um, todos os arquivos `.sql` localizados em `scripts/triggers/`. Cada arquivo cria um gatilho específico no banco de dados.
    5.  **Criação das Visões (Views):** De forma semelhante, o script executa todos os arquivos `.sql` da pasta `scripts/views/`, que criam as visões para consulta de dados.
    6.  **Finalização:** Ao final, uma mensagem de sucesso é exibida, indicando que o ambiente está pronto para uso.

## Como Usar

1.  Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina.
2.  Abra um terminal na raiz do projeto.
3.  Dê permissão de execução para o script com o comando: `chmod +x run.sh`
4.  Execute o script com: `./run.sh`

## Configurações

- O script possui variáveis no topo (`CONTAINER_NAME` e `MYSQL_PASS`) que podem ser alteradas para corresponder às configurações do seu ambiente, se necessário.
