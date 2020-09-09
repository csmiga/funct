def get_browser(browser, browser_version, platform, user_name, access_key):
    remote_url = "https://" + user_name + ":" + access_key + "@hub.lambdatest.com/wd/hub"
……………………………………………………………………………………………………………………………….
……………………………………………………………………………………………………………………………….
if browser == "chrome":
        # return Web(webdriver.Chrome())
        return HelperFunc(webdriver.Remote(command_executor=remote_url, desired_capabilities=caps))

