#!/bin/bash

echo "Iniciando a limpeza de arquivos temporários..."

# Lista de diretórios para limpar
diretorios=(
    "/tmp"
    "/var/tmp"
    "/var/cache"
    "$HOME/.cache"
    "/var/log"  # Pode ser perigoso!!! cuidado
    "/run"
    "/dev/shm"
    "$HOME/.local/share"
)

# Função para limpar diretórios
limpar_diretorio() {
    local dir="$1" # armazena o primeiro argumento passado para a função em uma variável local chamada dir.
    if [ -d "$dir" ]; then # verifica se o diretório existe.
        echo "Limpando $dir..."
        rm -rf "$dir"/* # para remover todos os arquivos e subdiretórios dentro de dir
    else
        echo "Diretório $dir não encontrado."
    fi
}

# Usando um loop for para limpar os diretórios listados
for dir in "${diretorios[@]}"; do
    limpar_diretorio "$dir"
done

echo "Limpeza concluída!"
