#!/bin/bash

FILE="/opt/sigor_log/estado_server.log"
DEST_EMAIL="juanandresgonza98@gmail.com,soporte@nts.com.py,luis.capdevila@nts.com.py"
DATE=`/bin/date +%d/%m/%Y`

if [ -f $FILE ]; then
        echo -e "Subject: YODA SERVER STATUS\\n\\n" && cat $FILE | msmtp -a YODA_SIGOR_CLOUD -t $DEST_EMAIL
        rm -f $FILE
else
        echo -e "Subject: YODA SERVER STATUS \\n\\nNo se ha generado el archivo del estado del servidor YODA. Favor verificar." | msmtp -a YODA_SIGOR_CLOUD -t $DEST_EMAIL
fi

