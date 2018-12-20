#!/bin/bash

# Install Chrome: https://www.ubuntuupdates.org/ppa/google_chrome?dist=stable

apt-get update && apt-get install -qqy wget
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
apt-get update -qqy && apt-get install -qqy google-chrome-stable && apt-get clean

# Install Chromedriver

apt-get update && apt-get install -qqy
wget -N http://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip
unzip chromedriver_linux64.zip -d ~/Downloads
mv -f ~/Downloads/chromedriver /usr/local/bin/chromedriver
chmod +x /usr/local/bin/chromedriver
chown root:root /usr/local/bin/chromedriver

# Export Chromedriver path to bash_profile

export PATH=$PATH:$(which chromedriver) >> ~/.bash_profile

google-chrome --version
chromedriver -v
which chromedriver
