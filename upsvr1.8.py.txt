#!/usr/bin/env python3
"""
Connect to Santak C1K online UPS and then acquire the status of UPS,
"""

serPort = '/dev/ttyS0'
# Command to switch off the output of UPS
# a few minute delay may be safe to switch off UPS output
# in case of only 2 computers (< 500 watts in total) to poweroff 
# before switching off UPS
upscmdQuery = 'Q1\r'
# poweroff computer in 3 minutes
time2shutdownComputer = '3'
# command to poweroff computer, "shutdown -P +3"
cmd2shutdownComputer = 'shutdown -P +' + time2shutdownComputer
# switch off ups in 5 minutes
time2switchOffUPS = '5'
# command to switchoff ups, "S05\r"
upscmdSwitchOff = 'S0' + time2switchOffUPS + '\r'

# It is considered as temporary power failure if power exception lasts less than 
# time4tempPowerfail(eg. 3 minutes) seconds. In such case, computer will not
# be shut down and UPS will not be switched off.
time4tempPowerfail = 180

import sys
import socket

host = None
port = 50000
backlog = 1
size = 1024
s = None

for res in socket.getaddrinfo(host, port, socket.AF_UNSPEC,
                                socket.SOCK_STREAM, 0, socket.AI_PASSIVE):
    af, socketype, proto, cannonname, sa = res
    try:
        s = socket.socket(af, socketype, proto)
    except socket.error as msg:
        s = None
        continue
    try:
        s.bind(sa)
        s.listen(backlog)
    except socket.error as msg:
        s.close()
        s = None
        continue
    break

if s is None:
    print('could not open socket')
    sys.exit(1)

import serial
import time
#import re

# configure the serial connections
ser = serial.Serial(port=serPort,\
                    baudrate=2400,\
                    bytesize=serial.EIGHTBITS,\
                    parity=serial.PARITY_NONE,\
                    stopbits=serial.STOPBITS_ONE,\
                    timeout=0)

# acquire the status of UPS
if not ser.isOpen():
    print('Could not access device:', serPort)
    sys.exit(1)

# for shlex.split()
import shlex
# for subprocess.call()
import subprocess

# for file open() and close()
import io
#fp = open("/data/informatics/inst/ups/santak/upsvr.log", 'w', buffering=1, encoding='utf8')
fp = open("/data/informatics/inst/ups/santak/upsvr.log", 'a', buffering=1, encoding='utf8')
# flag for invoking UPS status string line written into log file
nwrite = 0
# for date and time
import datetime
# for time.time()
import time
# for send_email.send_email()
import send_email

powerfail_flag = False
powerfail_begin_time = 0
stop_httpd_flag = False
shutdown_computer_flag = False
switchoff_ups_flag = False

while True:
    # Send query command to serial port device
    if ser.write(upscmdQuery.encode()) != len(upscmdQuery):
        print('Could not communicate with device:', serPort) 
        sys.exit(1)

    # let's wait one second before reading output (let's give device time to answer)
    time.sleep(1)
    stat = ''
    if ser.inWaiting() > 0:
        stat = ser.readline()
    else:
        print('No response from device:', serPort)
        sys.exit(1)

    # Keep acquiring UPS even UPS is temperrarily unavailable in the case of
    # the power recovery again after temperary power failure.
    if not stat:
        print('Warning, UPS status temperarily unavailable!', file=fp)
        time.sleep(30)
        continue

    # collection of hosts to connect to the current server 
#    hostSet = set()
#    while 1:
#        client, addr = s.accept()
#        print('Connected by', addr)
#        if addr[0] in hostSet:
#            client.send(stat)
#        else:
#            hostSet.add(addr[0])
#    
#        client.send(stat)
#        client.close() 
    
    nwrite += 1 
    if nwrite > 60:
        #print(stat[:-1].decode() + "\n")
        fp.write(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " " + (stat[:-1]).decode() + "\n")
        nwrite = 0

    #print(stat)

    #if re.search(b'1', stat[-9:-1]):
    if '1' in (stat[-9:-1]).decode():

        fp.write(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " " + (stat[:-1]).decode() + "\n")

        if powerfail_flag == False:
            powerfail_flag = True
            powerfail_begin_time = time.time()
            print("Power exception happened!", file=fp)
            continue
        elif (shutdown_computer_flag == True or time.time() < powerfail_begin_time + time4tempPowerfail):
            continue

        print("Power is not restored yet after", time.time() - powerfail_begin_time, "seconds", file=fp)

        # Request the computer running this program to wait a few minutes until shutting down
        # in order that there are enough to safely stop the important servers like httpd, mysqld etc.
        if shutdown_computer_flag == False:
            shutdown_computer_flag = True
            print("The computer", sa[0], "will be shut down after", time2shutdownComputer, 
                    "minutes:", cmd2shutdownComputer, file=fp)

            # send warning email for power exception
            #mailto = "xiezhq@7seabiotech.com"
            mailto = "13524709312@139.com"
            mailfrom = "root@ecms.localdomain"
            if send_email.send_email(mailto, mailfrom) == False:
                print("Fail to send email alerting to", mailto, file=fp)
            else:
                print("Power exception alerting to", mailto, "was sent", file=fp)
            try:
                #retcode = subprocess.call(cmd2shutdownComputer, shell=True)
                p = subprocess.Popen(shlex.split(cmd2shutdownComputer))
                # sleep 1 second for cmd2shutdownComputer to complete though it is usually not enough
                time.sleep(1)
                p.poll()
                retcode = p.returncode
                if retcode == None:
                    print("Child (", cmd2shutdownComputer, ") hasn\'t terminated yet", retcode, file=fp)
                else:
                    print("Child (", cmd2shutdownComputer, ") was terminated by signal(", retcode, ")", file=fp)
            except OSError as e:
                print("Running command (", cmd2shutdownComputer, ") failed:", e, file=fp)

        # Request UPS to wait a few minutes until switching off in order that there are enough
        # to safely stop the important servers like httpd, mysqld etc. and shutdown computer.
        if switchoff_ups_flag == False:
            switchoff_ups_flag = True
            print('The output of UPS', serPort, 'will be switched off in', time2switchOffUPS, 'minutes', file=fp)
            if ser.write(upscmdSwitchOff.encode()) != len(upscmdSwitchOff):
                print('Could not communicate with device:', serPort, file=fp) 
                #sys.exit(1)

        # stop httpd server
        if stop_httpd_flag == False:
            stop_httpd_flag = True
            cmd2stopHttpd = '/data/informatics/inst/httpd-2.2.22-linux-x64/bin/apachectl -k stop'
            p = subprocess.Popen(shlex.split(cmd2stopHttpd))
            # sleep 1 second for cmd2stopHttpd to complete
            time.sleep(1)
            p.poll()
            return_code = p.returncode
            if return_code == None:
                print("Child (", cmd2stopHttpd, ") hasn\'t terminated yet", file=fp)
            else:
                print("Child (", cmd2stopHttpd, ") was terminated by signal(", return_code, ")", file=fp)

        # shutdown mysql server installed in nonstandard directory
        #cmd2stopMysql = ''
    elif powerfail_flag == True:
        print("Power restored!", file=fp)
        powerfail_flag = False
        stop_httpd_flag = False
        shutdown_computer_flag = False
        switchoff_ups_flag = False

fp.close()
ser.close()
s.close()

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
