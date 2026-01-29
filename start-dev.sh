#!/bin/bash
# Script to start Docker and open interactive bash

echo "Starting Docker Compose in background..."
docker compose up -d

echo "Waiting for container to start..."
sleep 3

echo "Opening interactive bash..."
docker compose exec -it web bash
