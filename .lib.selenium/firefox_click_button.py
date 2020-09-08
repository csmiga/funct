#!/usr/bin/env python

import time
from selenium import webdriver

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
options.binary_location = '/usr/bin/firefox'

driver = webdriver.Firefox(firefox_options=options)
driver.get('http://codepad.org')

# click radio button
python_button = driver.find_elements_by_xpath("//input[@name='lang' and @value='Python']")[0]
python_button.click()

# type text
text_area = driver.find_element_by_id('textarea')
text_area.send_keys("print('Hello World')")

# click submit button
submit_button = driver.find_elements_by_xpath("/html/body/div/table/tbody/tr[1]/td/form/table/tbody/tr[3]/td/input")[0]
submit_button.click()

time.sleep(3)
driver.quit()
