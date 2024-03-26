#Script que limpia los logs viejos y deja el de los ultimos 3 dias
######################################################BRAGI####################################
echo "Limpiando el bochinche de bragi"
find /opt/wildfly_server/wildfly-18.0.1.Final/standalone-bragi/log -mtime +2 -exec rm -rf {} \;
echo "bragi limpio"

####################################################LOKI############################################
echo "Limpiando el bochinche de loki"
find /opt/wildfly_server/wildfly-18.0.1.Final/standalone-loki/log -mtime +2 -exec rm -rf {} \;
echo "loki limpio"

#####################################################THOR##############################################
echo "Limpiando el bochinche de thor"
find /opt/wildfly_server/wildfly-18.0.1.Final/standalone-thor/log -mtime +2 -exec rm -rf {} \;
echo "thor limpio"

###################################################TYR#######################################################
echo "Limpiando el bochinche de freyr"
find /opt/wildfly_server/wildfly-18.0.1.Final/standalone-freyr/log -mtime +2 -exec rm -rf {} \;
echo "freyr limpio"

echo "Limpieza finalizada... :) "

