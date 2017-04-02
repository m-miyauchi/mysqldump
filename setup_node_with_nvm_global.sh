#!/bin/sh
USER=`whoami`
HOME=/home/${USER}
# For Ubuntu
# Install nvm with git
echo "Starting setup nvm and gulp."
echo "Start install nvm..."
cd /usr/local/bin/
git clone https://github.com/creationix/nvm.git ${HOME}/.nvm
cd /usr/local/bin/.nvm
git checkout `git describe --abbrev=0 --tags`
# Start nvm
. /usr/local/bin/.nvm/nvm.sh
echo "Start install Node.js..."
nvm install stable
echo "# Start nvm" >> ${HOME}/.profile
echo "source /usr/local/bin/.nvm/nvm.sh" >> ${HOME}/.profile
echo  "nvm use stable &" >> ${HOME}/.profile
echo "Complete!"
