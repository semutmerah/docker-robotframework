FROM ubuntu:16.04

MAINTAINER Rasyid Fahroni <rasyid@rasyidfahroni.com>

LABEL "contains"="python, robotframework, selenium, chrome"

RUN apt-get update;\
apt-get upgrade -y;\
apt-get install -y software-properties-common \
python-software-properties \
python3-pip \
python3-tk \
unzip \
libx11-6 \
libnss3 \
libfontconfig1 \
libgconf2-4 \
wget;\
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -;\
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list;\
apt-get update;\
apt-get install -y google-chrome-stable;\
pip3 install --upgrade pip;\
pip3 install robotframework \
robotframework-faker;\
pip3 install --pre --upgrade robotframework-seleniumlibrary;\
cd /home;\
wget https://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip;\
unzip chromedriver_linux64.zip;\
rm -rf chromedriver_linux64.zip;\
mv -f chromedriver /usr/local/bin/chromedriver;\
chmod 0755 /usr/local/bin/chromedriver;\
