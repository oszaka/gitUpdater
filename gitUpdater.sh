#!/bin/bash

# Variables
VAULT_DIR="$HOME/Documents/CODE/$1"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Validation
if cd "$VAULT_DIR"; then
    echo "En la carpeta de notas..."
else
    echo "Error: No se pudo encontrar el directorio $VAULT_DIR"
    exit 1
fi

# 3. Verificar si hay cambios antes de hacer commit
if [[ -z $(git status --porcelain) ]]; then
    echo "No hay cambios para sincronizar."
    exit 0
fi

# 4. Ejecutar la sincronización
echo "Sincronizando cambios..."
git add .
git commit -m "Auto-sync: $TIMESTAMP"
git push

echo "Notas actualizadas correctamente el $TIMESTAMP"
