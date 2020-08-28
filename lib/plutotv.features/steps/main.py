import time
import os.path
from selenium import webdriver
from behave import *

@given('firefox web browser is installed')
def step(context):
    if os.path.isfile('/usr/bin/firefox'):
        print ("File exist")
    else:
        print ("File does not exist")

@when('plutotv is reachable')
def step(context):
    pass

@then('test plutotv main page')
def step(context):
    options = webdriver.FirefoxOptions()
    options.add_argument('--headless')
    options.binary_location = '/usr/bin/firefox'

    driver = webdriver.Firefox(firefox_options=options)
    driver.get('https://pluto.tv/')

    #print(driver.page_source)
    print("Title: %s" % driver.title)
    time.sleep(3)
    driver.quit()
