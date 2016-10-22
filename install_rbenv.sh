#!/bin/sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv
src/configure
make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'Enter command below and complete.'
echo '$ source ~/.bash_profile'
echo 'Check available ruby-version.'
echo '$ rbenv install -l'
