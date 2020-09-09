# -- ASSUMING: tags @browser.chrome or @browser.any are used.
# BETTER: Use Fixture for this example.

from behave.fixture import use_fixture_by_tag
from configparser import ConfigParser
from helper.helper_web import get_browser
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

import os
import time

caps = {}
 
def before_all(context):
    caps['browserName'] = context.config.userdata['browser']
    caps['version'] = context.config.userdata['browser_version']
    caps['platform'] = context.config.userdata['platform']
 
    helper_func = get_browser(caps['browserName'], caps['version'], caps['platform'], context.config.userdata['name'],
                  context.config.userdata['app_key'])
    context.helperfunc = helper_func
 
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
