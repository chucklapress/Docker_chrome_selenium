## Dockerfile and example test

## Resources in this project

Simplest implemetation is to just pull from Docker hub

```sh
docker pull chucklapress/chrome:latest
```
current version latest
## What's in the image

This is a bloat Ubuntu 18.04 image with a full on Python3 development suite  
The image includes Chromedriver meant to be run headless.  

```sh
docker run -it <image> /bin/bash
```
Then:  
```sh
./answer.py
```  
I made the python script executable from the command line
results in file added named flavors.txt with current gelato flavors  

Feel free to add your own selenium tests
```python
import time
from lxml import html
from selenium import webdriver
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--window-size=1420,1080')
chrome_options.add_argument('--headless')
chrome_options.add_argument('--disable-gpu')
chrome_options.add_argument('--disable-dev-shm-usage')
driver = webdriver.Chrome(chrome_options=chrome_options)
"""
your call as to what you'd like to build in here
"""
```

IMPORTANT TO NOTE chrome_options.add_argument('--disable-dev-shm-usage') needed to run  
Chrome seem to crash in Docker containers on certain pages due to too small /dev/shm. So you may have to fix the small /dev/shm size.  

##
UPDATE
05/23/2020
Streamlined again to not require the additional time for switching to i-frame as web owner eliminated that, also limited selections on scrape due to corona pandemic 

You will definately need to massage and play with the environment, most recent  
changes are the additions of:  

```python
import os
import locale
os.environ["PYTHONIOENCODING"] = "utf-8"
myLocale=locale.setlocale(category=locale.LC_ALL, locale="en_US.UTF-8")
```  
In the answer.py script, and apt-get install -y language-pack-en  
in the Dockerfile to stop any unicode to utf8 error in the call to print.  
So YMMV.
