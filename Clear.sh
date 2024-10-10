#!/bin/bash

echo "Iniciando a limpeza de arquivos temporários..."

# Lista de diretórios para limpar
diretorios=(
    "/tmp"
    "/var/tmp"
    "/var/cache"
    "$HOME/.cache"
    "/run"
    "/dev/shm"
    "$HOME/.local/share"
)

# Função para limpar diretórios
limpar_diretorio() {
    local dir="$1"
    if [ -d "$dir" ]; then
        echo "Limpando $dir..."
        # Perguntar confirmação antes de remover
        read -p "Você tem certeza que deseja limpar $dir? (s/n): " confirm
        if [[ "$confirm" =~ ^[sS]$ ]]; then
            find "$dir" -type f -exec rm -f {} \; # Remove apenas arquivos
            find "$dir" -type d -empty -delete # Remove diretórios vazios
            echo "Limpeza de $dir concluída."
        else
            echo "Limpeza de $dir cancelada."
        fi
    else
        echo "Diretório $dir não encontrado."
    fi
}

# Usando um loop for para limpar os diretórios listados
for dir in "${diretorios[@]}"; do
    limpar_diretorio "$dir"
done

echo "Limpeza concluída!"
