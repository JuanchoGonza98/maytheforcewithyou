# Set admin email so that you can get email.
ADMIN="juanandresgonza98@gmail.com,soporte@nts.com.py,luis.capdevila@nts.com.py"

# set alert level 92% is default

ALERT=90
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
echo $output
usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
partition=$(echo $output | awk '{ print $2 }' )
if [ $usep -ge $ALERT ]; then
echo -e "Subject:YODA ESTA GORDITO\\n\\nThe disk is running low on space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
msmtp -a YODA_SIGOR_CLOUD -t $ADMIN
fi
done
