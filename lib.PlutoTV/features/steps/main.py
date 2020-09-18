import time
import os
from selenium import webdriver
from behave import *

@given('firefox web browser is installed')
def step_impl(context):
    if os.path.isfile('/usr/bin/firefox'):
        return "pass"
    else:
        return "fail"

@when('pluto.tv is reachable')
def step_impl(context):
    #assert True is not False
    #assert context.failed is False
    pass

@then('test pluto.tv main page')
def step_impl(context):
    option = webdriver.FirefoxOptions()
    option.add_argument('--headless')
    option.binary_location = '/usr/bin/firefox'

    browser = webdriver.Firefox(firefox_options=option)
    browser.get('https://pluto.tv/')

    print(browser.page_source)
    #print("Title: %s" % browser.title)
    time.sleep(3)
    browser.quit()
