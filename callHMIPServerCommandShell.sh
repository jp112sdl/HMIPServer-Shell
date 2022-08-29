#!/bin/sh
echo -n "crRFD Mods - "
LINE='Eventbus.Command.Shell.Enabled=true'
FILE='/var/etc/crRFD.conf'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi

echo -n "Stopping HMIPserver (waiting for max. 60 sec to finish)"

monit stop HMIPServer

for i in `seq 1 60`; do
   echo -n "."
   sleep 1
   ps -ef|grep -v grep|grep -q HMIPServer
   res=$?
   if [ "$res" -eq 1 ]; then
     break
   fi
   if [ "$i" -eq 60 ]; then
     echo " - TIMEOUT"
     exit 13
   fi
done
echo " - done"

/opt/java-azul/bin/java -Dos.arch=`uname -m` -Dgnu.io.rxtx.SerialPorts=/dev/mmd_hmip -Xmx384m -Dlog4j.configurationFile=file:///var/etc/log4j2.xml -Dfile.encoding=ISO-8859-1 -cp /opt/HMServer/HMIPServer.jar:/opt/HMServer/coupling/ESHBridge.jar de.eq3.ccu.server.ip.HMIPServer /var/etc/crRFD.conf /var/etc/HMServer.conf