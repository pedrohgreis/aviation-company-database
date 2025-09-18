# Copilot Instructions for AI Agents

## Visão Geral do Projeto
Este repositório contém scripts SQL e configuração Docker para inicializar e manipular um banco de dados MySQL 8.1, voltado para uma empresa de aviação. O projeto é organizado para facilitar a persistência de dados, migração entre ambientes e execução automatizada via Docker.

## Estrutura de Pastas
- `inicializar/`: Scripts SQL executados apenas na primeira inicialização do container (ex: criação de esquema, backup inicial).
- `scripts/`: Scripts SQL para manipulação manual do banco (ex: popular dados, triggers, visões).
- `docker-compose.yml`: Configuração do container MySQL.
- `dados/`: (pode não existir no workspace) Pasta para persistência dos dados do MySQL.

## Fluxo de Trabalho Principal
1. **Inicialização do Banco**:
   - Suba o container com: `docker-compose up -d`
   - Scripts em `inicializar/` são aplicados automaticamente na primeira inicialização.
2. **Acesso ao MySQL**:
   - CLI padrão: `docker exec -i meubanco mysql -u root`
   - Alternativa Windows: `docker exec -it meubanco mysql -h 127.0.0.1 -P 3306 -u root -p`
3. **Execução de Scripts Manuais**:
   - Use a CLI do MySQL para rodar scripts de `scripts/` com: `SOURCE ./scripts/arquivo.sql`
4. **Backup**:
   - Execute: `docker exec -i meubanco mysqldump -u root -padmin --all-databases > ./scripts/backup.sql`
5. **Finalização**:
   - Para parar: `docker-compose down`
   - Para limpar volumes: `docker-compose down -v` (remova manualmente a pasta `dados` se necessário)

## Convenções Específicas
- Scripts de inicialização não devem ser reaplicados após o primeiro uso.
- Scripts manuais podem ser executados a qualquer momento via CLI.
- O nome do container padrão é `meubanco` (ajuste se necessário).
- Senha padrão do root: `admin` (confirme no `docker-compose.yml`).

## Padrões de Código
- Scripts SQL seguem separação por função: esquema, popular dados, triggers, visões.
- Documentação de cada script pode estar em arquivos `.md` correspondentes.
- Use comentários SQL para explicar lógicas não triviais.

## Exemplos de Comandos
- Inicializar: `docker-compose up -d`
- Executar script: `SOURCE ./scripts/2_popular.sql`
- Backup: `docker exec -i meubanco mysqldump -u root -padmin --all-databases > ./scripts/backup.sql`
- Parar e limpar: `docker-compose down -v`

## Integrações e Dependências
- Docker e Docker Compose são obrigatórios.
- MySQL 8.1 é a versão alvo.
- Scripts podem ser adaptados para outros ambientes, mas o fluxo principal é via Docker.

## Arquivos-Chave
- `docker-compose.yml`: Configuração do ambiente.
- `inicializar/1_esquema.sql`: Esquema inicial do banco.
- `scripts/2_popular.sql`, `3_trigger.sql`, `4_visao1.sql`, `4_visao2.sql`: Scripts de manipulação e consulta.

---

> Atualize este documento conforme novas convenções ou fluxos forem adotados.
