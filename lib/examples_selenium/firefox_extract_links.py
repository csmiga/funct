#!/usr/bin/env python

import time
from selenium import webdriver

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
options.binary_location = '/usr/bin/firefox'

driver = webdriver.Firefox(firefox_options=options)
driver.get('http://codepad.org')

driver.get('https://www.w3.org/')
for a in driver.find_elements_by_xpath('.//a'):
    print(a.get_attribute('href'))

time.sleep(3)
driver.quit()
