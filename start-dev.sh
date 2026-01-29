#!/bin/bash
# Script para iniciar o Docker e abrir bash interativo

echo "Iniciando Docker Compose em background..."
docker compose up -d

echo "Aguardando container iniciar..."
sleep 3

echo "Abrindo bash interativo..."
docker compose exec -it web bash
