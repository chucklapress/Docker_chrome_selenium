## Dockerfile and example test

## Resources in this project

Simplest implemetation is to just pull from Docker hub

```sh
docker pull chucklapress/chrome:v1
```

## What's in the image

This is a bloat Ubuntu 18.04 image with a full one Python3 development suite  
The image includes Chromedriver meant to be run headless.  

```sh
docker run -it <image> /bin/bash
```
Then:  
```sh
touch test.py
```
Then:  

```python
from selenium import webdriver
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--window-size=1420,1080')
chrome_options.add_argument('--headless')
chrome_options.add_argument('--disable-gpu')
driver = webdriver.Chrome(chrome_options=chrome_options)

driver.get('http://www.google.com')
screenshot = driver.save_screenshot('test.png')
driver.quit()
```
Will result in the creation of a file named "test.png"
