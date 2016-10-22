#!/bin/sh
USER=`whoami`
HOME=/home/${USER}
# For Ubuntu
# Install nvm with git
echo "Starting setup nvm and gulp."
echo "Start install nvm..."
git clone https://github.com/creationix/nvm.git ${HOME}/.nvm
cd ${HOME}/.nvm
git checkout `git describe --abbrev=0 --tags`
# Start nvm
. ${HOME}/.nvm/nvm.sh
echo "Start install Node.js..."
nvm install stable
echo "Start install gulp..."
npm install -g gulp
echo "# Start nvm" >> ${HOME}/.profile
echo "source ~/.nvm/nvm.sh" >> ${HOME}/.profile
echo  "nvm use stable" >> ${HOME}/.profile
echo "Complete!"
