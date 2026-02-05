I have developed software tools and scripts in different programming language since 1997. I mainly used C (sometimes bash, csh, etc.) under Unix/Linux before 2010, but moved to python (sometimes PHP/SQL under Linux/MySQL) after 2010. The code examples below are Python (upsvr1.8.py), PHP/SQL (weberp-operate-db-meta.php) and Bash (ip2xx2ecmsbackup2excludelist20120224.sh) codes developed during 2011-2014 and C (kdtree.c) codes developed in 2006.

* ip2xx2ecmsbackup2excludelist20120224.sh
  * It is a Bash shell script for a system administration job, synchronizing data from windows host to local Linux host across network. The script will synchronize data from remote hosts (windows PC) to local Linux host. It can be used to do the daily data backup if scheduled by Cron jobs on Linux. It automatically send the notification email and text message to the preconfigured email address and mobile phone number.

* weberp-operate-db-meta.php
  * It is a PHP script to perform the data acquisition from web page and update the data in MySQL database. 

* upsvr1.8.py
  * It is a Python script to perform automatic power status inquery and Linux server shutdown. It automatically detects the office power status (e.g. power failure or power outage) and shutdown linux server and UPS (it will stop critical running services on Linux like httpd and mysqld before shutdown Linux server) if power outage happens.

* kdtree.c
  * It is a C implementation of KD tree. It can be modified and used to search for nearest atoms in protein structures.

My recent code samples can be found at my github site (https://github.com/xiezhq/isescan) where ISEScan is a pipeline I developed to automatically identify mobile genetic elements in bacterial genome and metagenome. I mainly used C to develop the CPU-intensive applications in structural bioinformatics, specifically, protein structure and modeling. 

You can also find some obsolete but still usable C code examples at https://github.com/xiezhq/builddata, which is used to analyze the protein-protein interface in protein complex.








