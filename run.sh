#!/bin/bash

# --- CONFIGURAÇÕES ---
# Suas informações já foram substituídas aqui.
CONTAINER_NAME="meubanco2"
MYSQL_PASS="admin"
# --- FIM DAS CONFIGURAÇÕES ---

echo "🚀 Iniciando os contêineres do Docker..."
docker-compose up -d

echo "⏳ Aguardando o MySQL iniciar completamente (15 segundos)..."
sleep 15

echo "1️⃣ Executando script de criação do esquema (1_esquema.sql)..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" <inicializar/1_esquema.sql

echo "3️⃣ Executando scripts de Triggers..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/3_trigger.sql
#docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/3_triggerAtivado.sql

echo "4️⃣ Executando scripts de Views..."
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/4_visao1.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/4_visao2.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/4_visao3.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/4_visao4.sql
docker exec -i "$CONTAINER_NAME" mysql -u root -p"$MYSQL_PASS" flyBase <scripts/4_visao5.sql

echo "✅ Pronto! O banco de dados foi configurado e populado com sucesso."
