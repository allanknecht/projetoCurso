@echo off
REM Script to start Docker and open interactive bash on Windows

echo Starting Docker Compose in background...
docker compose up -d

echo Waiting for container to start...
timeout /t 3 /nobreak >nul

echo Opening interactive bash...
docker compose exec -it web bash
