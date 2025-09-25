#!/bin/bash

# --- CONFIGURAÇÕES ---
# Suas informações já foram substituídas aqui.
CONTAINER_NAME="meubanco2"
MYSQL_PASS="admin"
# --- FIM DAS CONFIGURAÇÕES ---

echo "🚀 Iniciando os contêineres do Docker..."
docker-compose up -d

echo "⏳ Aguardando o MySQL iniciar completamente (10 segundos)..."
sleep 10

echo "1.Executando script de criação de tabelas (inicializa_Tables.sql)..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" <inicializar/inicializa_Tables.sql

#echo "2️⃣ Executando script de inicialização do log histórico (inicializa_Log_Historico.sql)..."
#docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase < inicializar/inicializa_Log_Historico.sql

echo "2.Populando o banco de dados (insercao_de_dados.sql)..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/insercao_de_dados.sql

echo "3.Executando scripts de Triggers..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/triggers/tg_LogDeStatusDoVoo.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/triggers/tr_checa_capacidade_de_voo.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/triggers/tr_funcionariosDemitidos.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/triggers/tr_naoEscalados.sql

echo "4.Executando scripts de Views..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/views/VM_detalheReservaCliente.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/views/VM_historicoPassageiro.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/views/VM_Horario_Voos_Detalhado.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/views/VM_PassageirosdoVoo.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/views/VM_voosComAtraso.sql

echo "✅ Pronto! O banco de dados foi configurado e populado com sucesso."

