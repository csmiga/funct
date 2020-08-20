#!/usr/bin/env python

import time
from selenium import webdriver

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
options.binary_location = '/usr/bin/firefox'

driver = webdriver.Firefox(firefox_options=options)
driver.get('http://codepad.org')

text_area = driver.find_element_by_id('textarea')
text_area.send_keys("This text is send using Python code.")

time.sleep(3)
driver.quit()
