#!/bin/bash

print_menu() {
    echo "Escaneo de Puertos"
    echo "1. Escanear puertos abiertos"
    echo "2. Salir"
}

scan_ports() {
    read -p "Introduce la dirección IP a escanear: " ip_address
    echo "Escaneando la dirección IP $ip_address..."
    nmap -p- --open -n -Pn -vvv $ip_address | grep -E '^[0-9]+/tcp' | awk '{print "\033[1;32mPuerto abierto:\033[0m", $1, "\033[1;34mEstado:\033[0m", $2}'
}

while true; do
    print_menu
    read -p "Elige una opción: " option
    case $option in
        1) scan_ports ;;
        2) echo "Saliendo del programa. ¡Hasta luego!"; break ;;
        *) echo "Opción no válida";;
    esac
done
