#!/bin/bash

touch /tmp/InstallGM.log
apt-get update &>> /tmp/InstallGM.log
apt-get install -y gawk gzip zip unzip tar grep coreutils perl openssl net-tools telnet psmisc sendmail wget lib32stdc++6 &>> /tmp/InstallGM.log

wget -O /tmp/GateManager.tgz https://firmware.secomea.com/download/gatemanager/8250 &>> /tmp/InstallGM.log

tar -xzvf /tmp/GateManager.tgz --directory /tmp/ &>> /tmp/InstallGM.log

echo "DN_C='DK'
DN_ST='Denmark'
DN_L='Herlev'
DN_O='Secomea'
DN_OU='IT-Hosting'
DN_EMAIL='hosting@secomea.com'
DN_KW='it hosting'
CA_VERBOSE=''
" > /tmp/local_ca.props

chmod +x /tmp/RUN_GM_INSTALLER &>> /tmp/InstallGM.log
cd /tmp/
bash RUN_GM_INSTALLER --ca /tmp/local_ca.props -y &>> /tmp/InstallGM.log

gm stop &>> /tmp/InstallGM.log
