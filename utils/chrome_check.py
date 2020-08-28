#!/usr/bin/env python


from selenium import webdriver

try:
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--ignore-certificate-errors')
    options.add_argument("--test-type")
    options.binary_location = '/usr/bin/chromium-browser'

    driver = webdriver.Chrome('/usr/bin/chromedriver',chrome_options=options)
    driver.get('https://pluto.tv/')

    #print(driver.page_source)
    print("Title: %s" % driver.title)

finally:
    try:
        time.sleep(3)
        driver.quit()
    except:
        pass
