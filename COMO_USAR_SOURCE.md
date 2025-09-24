### Como Usar o Comando `SOURCE` no MySQL

O comando `SOURCE` é utilizado para executar um arquivo de script SQL de dentro do cliente interativo do MySQL. O seu ambiente já está preparado para isso.

**Passo a Passo:**

1.  **Acesse o terminal do contêiner Docker:**

    ```bash
    docker exec -it meubanco2 bash
    ```

2.  **Conecte-se ao banco de dados `flyBase` com o cliente MySQL:**

    ```bash
    mysql -u root -padmin flyBase
    ```

3.  **Execute o script desejado usando o comando `SOURCE`:**

    Uma vez dentro do prompt `mysql>`, você pode executar qualquer script. A sua pasta local `scripts` está disponível no caminho `/scripts` dentro do contêiner.

    **Exemplos:**

    Para executar o script que popula o banco de dados:
    ```sql
    SOURCE /scripts/2_popular.sql;
    ```

    Para criar a primeira visão:
    ```sql
    SOURCE /scripts/4_visao1.sql;
    ```

    Para criar o gatilho:
    ```sql
    SOURCE /scripts/3_trigger.sql;
    ```

### Por que isso funciona?

O arquivo `docker-compose.yml` contém a seguinte configuração de volume:

```yaml
volumes:
  - ./scripts:/scripts
```

Isso faz com que a sua pasta `./scripts` (no seu computador) seja espelhada como a pasta `/scripts` (dentro do contêiner), tornando os arquivos acessíveis para o cliente MySQL que roda no contêiner.
