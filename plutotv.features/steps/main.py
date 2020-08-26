#!/usr/bin/env python

import time
from selenium import webdriver
from behave import *

@given('firefox web browser is installed)
def step(context):
    global options = webdriver.FirefoxOptions()
    options.add_argument('--headless')
    options.binary_location = '/usr/bin/firefox'

@when('plutotv is reachable')
def step(context):
    global driver = webdriver.Firefox(firefox_options=options)
    driver.get('https://pluto.tv/')

@then('test plutotv main page')
def step(context):
    #print(driver.page_source)
    print("Title: %s" % driver.title)
    time.sleep(3)
    driver.quit()
