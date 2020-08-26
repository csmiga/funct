#!/usr/bin/env python

import time
import pickle
from selenium import webdriver

try:
    options = webdriver.FirefoxOptions()
    options.add_argument('--headless')
    options.binary_location = '/usr/bin/firefox'

    driver = webdriver.Firefox(firefox_options=options)
    driver.get('http://codepad.org')

    pickle.dump(driver.get_cookies(), open("firefox_cookies.pkl","wb"))

finally:
    try:
        time.sleep(3)
        driver.quit()
    except:
        pass
