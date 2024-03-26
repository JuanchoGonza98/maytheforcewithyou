"Iniciando limpieza"
find /saes_files/expedientes/produccion/tmp ! -mtime 0 -exec rm -rf {} \;
echo "Limpieza finalizada"
