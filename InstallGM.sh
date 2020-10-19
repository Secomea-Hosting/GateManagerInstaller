#!/bin/bash

echo -e "Initiating Log...\c"
touch /tmp/InstallGM.log
apt-get update &>> /tmp/InstallGM.log
echo -e "Done"

echo -e "Installing Packages...\c"
apt-get install -y gawk gzip zip unzip tar grep coreutils perl openssl net-tools telnet psmisc sendmail wget lib32stdc++6 &>> /tmp/InstallGM.log
echo -e "Done"

echo -e "Downloading GateManager Installer...\c"
wget -O /tmp/GateManager.tgz https://firmware.secomea.com/download/gatemanager/8250 &>> /tmp/InstallGM.log
echo -e "Done"

echo -e "Unpacking GateManager Installer...\c"
tar -xzvf /tmp/GateManager.tgz --directory /tmp/ &>> /tmp/InstallGM.log
echo -e "Done"

echo "Starting Installer..."
echo "DN_C=''
DN_ST=''
DN_L=''
DN_O=''
DN_OU=''
DN_EMAIL=''
DN_KW=''
CA_VERBOSE=''
" > /tmp/local_ca.props

chmod +x /tmp/RUN_GM_INSTALLER &>> /tmp/InstallGM.log
cd /tmp/
bash RUN_GM_INSTALLER --ca /tmp/local_ca.props -y &>> /tmp/InstallGM.log

gm stop &>> /tmp/InstallGM.log
echo "Done"
