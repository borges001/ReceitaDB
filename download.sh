#!/bin/bash

# Variáveis
DOWNLOAD_DIR="Downloads"
DATA_DIR="Data"
URL="http://200.152.38.155/CNPJ/"  # Substitua pelo URL real

# Alvos
download() {
    echo "Iniciando download..."
    wget -r -np -nH --cut-dirs=1 -R "index.html*" -P "$DOWNLOAD_DIR" "$URL"
    echo "Extraindo arquivos..."
    unzip "$DOWNLOAD_DIR"/*.zip -d "$DATA_DIR"
}

create_download_dir() {
    mkdir -p "$DOWNLOAD_DIR"
}

create_data_dir() {
    mkdir -p "$DATA_DIR"
}

clean() {
    echo "Limpando diretórios..."
    rm -rf "$DOWNLOAD_DIR" "$DATA_DIR"
}

# Execução
case "$1" in
    "download")
        create_download_dir
        create_data_dir
        download
        ;;
    "clean")
        clean
        ;;
    *)
        echo "Uso: $0 {download|clean}"
        exit 1
        ;;
esac

exit 0
