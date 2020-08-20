#!/usr/bin/env python

import time
from selenium import webdriver

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
options.binary_location = '/usr/bin/firefox'

driver = webdriver.Firefox(firefox_options=options)
driver.get('https://python.org')
driver.save_screenshot("screenshot.png")

time.sleep(3)
driver.close()
