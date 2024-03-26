#!/bin/bash

# Directorio original
DIR_ORIG="/saes_files/expedientes/produccion"

# Directorio donde mover los archivos antiguos
DIR_DEST="/saes_old_files/expedientes/produccion"

# Año hasta el que quieres buscar
YEAR="2020"

# Contador para monitorear la cantidad de subdirectorios procesados
COUNT=0

# Recorre todos los subdirectorios del directorio original
for dir in "$DIR_ORIG"/*; do
    # Comprueba si el directorio fue modificado antes del año especificado
    if [[ $(find "$dir" -maxdepth 0 ! -newermt "$YEAR-01-01" -print) ]]; then
        # Extrae el nombre del subdirectorio
        subdir=$(basename "$dir")

        # Muestra en la consola el subdirectorio que se va a mover
        echo "Moviendo el subdirectorio: $subdir"

        # Mueve el subdirectorio al directorio de destino
        mv "$dir" "$DIR_DEST/$subdir"

        # Muestra en la consola el subdirectorio que se movió
        echo "Subdirectorio movido: $subdir"

        # Crea un enlace simbólico en el directorio original
        ln -s "$DIR_DEST/$subdir" "$DIR_ORIG/$subdir"

        # Incrementa el contador
        ((COUNT++))

        # Muestra en la consola la cantidad de subdirectorios procesados
        echo "Subdirectorios procesados: $COUNT"
    fi
done

# Muestra en la consola la cantidad total de subdirectorios procesados
echo "Total de subdirectorios procesados: $COUNT"
echo "Script finalizado con exito" 


