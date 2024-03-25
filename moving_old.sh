#!/bin/bash

# Solicitar al usuario que ingrese el directorio de origen, destino y la fecha
read -p "Por favor, ingrese el directorio de origen: " origen
read -p "Por favor, ingrese el directorio de destino: " destino
read -p "Por favor, ingrese la fecha (formato YYYY-MM-DD): " fecha

# Crear una lista de los archivos y directorios a mover
lista=$(find "$origen" -type f -or -type d ! -newermt "$fecha")

# Contar el total de archivos y directorios a mover
total=$(echo "$lista" | wc -l)

# Variables para llevar un recuento de los archivos/directorios movidos y enlaces simbólicos creados
contador_archivos=0
contador_enlaces=0

# Iterar sobre cada archivo/directorio en la lista
echo "$lista" | while read -r archivo; do
  # Mover el archivo/directorio y crear un enlace simbólico
  mv "$archivo" "$destino" && ln -s "$destino/$archivo" "$archivo"
  if [ $? -eq 0 ]; then
    # Incrementar el contador de archivos y enlaces si la operación fue exitosa
    contador_archivos=$((contador_archivos + 1))
    contador_enlaces=$((contador_enlaces + 1))
  fi

  # Imprimir el progreso
  echo "Movidos $contador_archivos de $total archivos/directorios"
  echo "Creados $contador_enlaces de $total enlaces simbólicos"
done


