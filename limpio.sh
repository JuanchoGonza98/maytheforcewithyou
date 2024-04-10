#!/bin/bash

# Directorio original
DIR_ORIG="/saes_files/expedientes/produccion"

# Directorio donde mover los archivos antiguos
DIR_DEST="/saes_old_files/expedientes/produccion"

# Contador para monitorear la cantidad de subdirectorios procesados
COUNT=0

# Contador para controlar los lotes de 100
BATCH=0

# Recorre todos los subdirectorios del directorio original
for dir in "$DIR_ORIG"/*; do
    # Comprueba si el directorio es diferente de "expedientes"
    if [[ $(basename "$dir") != "expedientes" ]]; then
        # Extrae el nombre del subdirectorio
        subdir=$(basename "$dir")

        # Crea un enlace simbólico en el directorio original
        #ln -s "$DIR_ORIG/$subdir" "$DIR_ORIG/$subdir"

        # Muestra en la consola el subdirectorio que se va a mover
        echo "Moviendo el subdirectorio: $subdir"

        # Mueve el subdirectorio al directorio de destino
        mv "$dir" "$DIR_DEST/$subdir"

        # Muestra en la consola el subdirectorio que se movió
        echo "Subdirectorio movido: $subdir"

        # Crea un enlace simbólico en el directorio original
        echo "Creando enlace simbolico de: $subdir"
	ln -s "$DIR_DEST/$subdir" "$dir"

        # Incrementa el contador
        ((COUNT++))
        ((BATCH++))

        # Muestra en la consola la cantidad de subdirectorios procesados
        echo "Subdirectorios procesados: $COUNT"

        # Si se han procesado 100 subdirectorios, muestra un mensaje y reinicia el contador de lotes
        if (( BATCH == 100 )); then
            echo "Se han procesado 100 subdirectorios en este lote."
            break
        fi
    fi
done

# Muestra en la consola la cantidad total de subdirectorios procesados
echo "Total de subdirectorios procesados: $COUNT"
echo "Script finalizado"

