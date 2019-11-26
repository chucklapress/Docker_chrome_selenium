## Dockerfile and example test

## Resources in this project

Simplest implemetation is to just pull from Docker hub

```sh
docker pull chucklapress/chrome:v3
```
current version 3
## What's in the image

This is a bloat Ubuntu 18.04 image with a full one Python3 development suite  
The image includes Chromedriver meant to be run headless.  

```sh
docker run -it <image> /bin/bash
```
Then:  
```sh
python3 answer.py
```
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

When running the Docker image you may have to prime the pump once with  
answer.py as it misses the iframe element the first time inconsistently.
