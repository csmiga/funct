# File: features/steps/step_tutorial01.py
#
# Tutorial 1: First Steps
# https://jenisys.github.io/behave.example/tutorials/tutorial01.html
#
# Goal: Show basics, make first steps

# ----------------------------------------------------------------------------
# STEPS:
# ----------------------------------------------------------------------------
from behave import given, when, then

@given('we have behave installed')
def step_impl(context):
    pass

@when('we implement a test')
def step_impl(context):
    assert True is not False

@then('behave will test it for us!')
def step_impl(context):
    assert context.failed is False
