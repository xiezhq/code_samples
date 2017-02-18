#!/bin/bash

# backup windows PCs to ecms
HOSTLIST=/data/informatics/inst/backup/cronTask/pclist
SOURCE01=/mnt/data2backup
DESTINATION01=/data/data2backup

ExcludeList=/data/informatics/inst/backup/cronTask/backupExcludeList4ip2042ecms.txt
SOURCE1=/mnt/win/business
SOURCE2=/mnt/win/informatics
SOURCE3=/mnt/win/xie
SOURCE4=/mnt/win/work

DESTINATION=/data

BACKUPSCRIPT=/data/informatics/inst/backup/cronTask/ip2xx2ecmsbackup2excludelist20120224.sh
#LOGFILE=/var/tmp/ip2042ecmsbackup.log
#LOGFILE=/var/tmp/ip2xx2ecmsbackup.log
LOGFILE=/var/tmp/ip2xx2ecmsbackup2excludelist20120224.log

#MAILSUB="The log of backuping ip204 to ecms"
MAILSUB="The log of backuping ip2xx to ecms"
MAILTO=13524709312@139.com
#MAILTO="xiezhq@7seabiotech.com 13524709312@139.com"
MAILFROM=softinst@ecms.localdomain

if crontab -l > $LOGFILE 2>&1; then
	cat $BACKUPSCRIPT >> $LOGFILE 2>&1

	for host in $(cat $HOSTLIST)
	do
		mp="$SOURCE01/$host"
		if mountpoint -q $mp; then
			# source directory to backup must be already available (mounted) to ecms before rsyncing below.
			echo "starting: rsync -avz --delete $mp $DESTINATION01 >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
			rsync -avz --delete $mp $DESTINATION01 >> $LOGFILE 2>&1
			echo "ended: rsync -avz --delete $mp $DESTINATION01 >> $LOGFILE 2>&1\n" >> $LOGFILE 2>&1
		fi
	done

	# "192.168.1.204:d" must be mounted by root on ecms /mnt/win in advance
	# before backuping. using the following command to mount cifs file system:
	# mount -t cifs 192.168.1.204:d /mnt/win -o username=xieuser,password=*****
	# It'd better to add the following line in /etc/fstab on ecms:
	# 192.168.1.204:d /mnt/win cifs username=user,password=123456789,_netdev 0 0
	#
	if mountpoint -q /mnt/win; then
		echo "starting: rsync -avz --delete $SOURCE1 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		rsync -avz --delete $SOURCE1 $DESTINATION >> $LOGFILE 2>&1
		echo "ended: rsync -avz --delete $SOURCE1 $DESTINATION >> $LOGFILE 2>&1\n" >> $LOGFILE 2>&1
		#rsync -avz $SOURCE2 $DESTINATION >> $LOGFILE 2>&1
		echo "starting: rsync -av --exclude-from=${ExcludeList} $SOURCE2 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		rsync -av --exclude-from=${ExcludeList} $SOURCE2 $DESTINATION >> $LOGFILE 2>&1
		echo "ended: rsync -av --exclude-from=${ExcludeList} $SOURCE2 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		echo "starting: rsync -av --exclude-from=${ExcludeList} $SOURCE3 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		rsync -av --exclude-from=${ExcludeList} $SOURCE3 $DESTINATION >> $LOGFILE 2>&1
		echo "ended: rsync -av --exclude-from=${ExcludeList} $SOURCE3 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		echo "starting: rsync -av --exclude-from=${ExcludeList} $SOURCE4 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
		rsync -av --exclude-from=${ExcludeList} $SOURCE4 $DESTINATION >> $LOGFILE 2>&1
		echo "ended: rsync -av --exclude-from=${ExcludeList} $SOURCE4 $DESTINATION >> $LOGFILE 2>&1" >> $LOGFILE 2>&1
	fi

	date >> $LOGFILE 2>&1
	mail -s "$MAILSUB" < $BACKUPSCRIPT -a $LOGFILE -S from=$MAILFROM -b $MAILFROM $MAILTO
fi

