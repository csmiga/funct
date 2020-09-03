# -- ASSUMING: tags @browser.chrome or @browser.any are used.
# BETTER: Use Fixture for this example.
def before_tag(context, tag):
    if tag.startswith("browser."):
        browser_type = tag.replace("browser.", "", 1)
        if browser_type == "chrome":
            context.browser = webdriver.Chrome()
        else:
            context.browser = webdriver.PlainVanilla()