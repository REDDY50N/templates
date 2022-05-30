#!/bin/bash
#
# Dienst zur Anpassung des PCM 2.1.0, das fuer die neue Hardware auf einen neueren SuSE
# in einer chroot-Umgebung laeuft. Die alten Dienste werden nicht mehr in einem System V
# unterstuetzt. Dieses Scrpit wird per Systemd aufgerufen und kann fuer Systemanpassungen
# genutzt werden.
#

PMFSCKFILE=/data/.fsck.pmdatafs
PMFSMTFILE=/data/.mnt.pmdatafs


start(){
	touch $PMFSMTFILE || true
	#dir /data/ 2>&1 > /opt/polar/pmfsck.start.log
	#echo "pmfsck start"  2>&1 >> /opt/polar/pmfsck.start.log
	/usr/bin/date  2>&1 > /opt/polar/pmfsck.start.log
}

stop(){
	if [ -e $PMFSMTFILE ]; then
		rm $PMFSMTFILE
	fi
	
	if [ -e $PMFSCKFILE ]; then
		rm $PMFSCKFILE
	fi
	#dir /data/ 2>&1 > /opt/polar/pmfsck.stop.log
	#echo "pmfsck stop"  2>&1 >> /opt/polar/pmfsck.stop.log
	/usr/bin/date  2>&1 > /opt/polar/pmfsck.stop.log
}

case $1 in
	start|stop)
		#/usr/bin/date  2>&1 >> /opt/polar/pmfsck.calls.log
		#echo "pmfsck called $1"  2>&1 >> /opt/polar/pmfsck.calls.log
		"$1"
	       	;;
esac

