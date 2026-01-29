@echo off
REM Script para iniciar o Docker e abrir bash interativo no Windows

echo Iniciando Docker Compose em background...
docker compose up -d

echo Aguardando container iniciar...
timeout /t 3 /nobreak >nul

echo Abrindo bash interativo...
docker compose exec -it web bash
