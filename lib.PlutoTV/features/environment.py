from selenium import webdriver

def before_all(context):
    desired_capabilities = webdriver.DesiredCapabilities.FIREFOX
    desired_capabilities['browserName': 'firefox'
    #desired_capabilities['version'] = '80'
    #desired_capabilities['platform'] = 'LINUX'
    #desired_capabilities['name'] = 'Testing Selenium with Behave'
    #desired_capabilities['client_key'] = 'key'
    #desired_capabilities['client_secret'] = 'secret'

    context.browser = webdriver.Remote(
        desired_capabilities=desired_capabilities,
        command_executor="http://www.google.com"

    options = webdriver.FirefoxOptions()
    options.add_argument('--headless')
    options.binary_location = '/usr/bin/firefox'

    )

def after_all(context):
    context.browser.quit()
