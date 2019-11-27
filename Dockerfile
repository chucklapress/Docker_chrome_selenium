FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y wget
RUN apt-get install -y gnupg2
RUN apt-get install -y curl

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# set display port to avoid crash
ENV DISPLAY=:99

# set python
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev
RUN apt-get install -y python3-venv
RUN apt-get install -y language-pack-en

# install selenium
RUN pip3 install selenium==3.8.0
RUN pip3 install lxml==4.4.2

# install application
ADD answer.py /
