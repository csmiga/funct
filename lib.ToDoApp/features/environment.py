# -- ASSUMING: tags @browser.chrome or @browser.any are used.
# BETTER: Use Fixture for this example.

from behave.fixture import use_fixture_by_tag
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from configparser import ConfigParser

import os
import time

from helper.helper_web import get_browser

def before_all(context):
    config = ConfigParser()
    print((os.path.join(os.getcwd(), 'setup.cfg')))
    my_file = (os.path.join(os.getcwd(), 'setup.cfg'))
    config.read(my_file)

    # Reading the browser type from the configuration file for Selenium Python Tutorial
    helper_func = get_browser(config.get('Environment', 'Browser'))
    context.helperfunc = helper_func

    # Local Chrome WebDriver
    #if context.browser == "chrome":
    #   context.driver = webdriver.Chrome()

def after_all(context):
    context.helperfunc.close()

#def before_step(context, step)
#    pass

#def after_step(context, step)
#    pass

#def before_scenario(context, feature)
#    pass

#def after_scenario(context, feature) 
#    pass
