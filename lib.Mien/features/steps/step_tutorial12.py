# File: features/steps/step_tutorial12.py
#
# Tutorial 12: Use another Spoken Language
# https://jenisys.github.io/behave.example/tutorials/tutorial12.html
# 
# Goal:	Use another spoken language for testing (other than English)

# -*- coding: UTF-8 -*-
# language: de

# ----------------------------------------------------------------------------
# STEPS:
# ----------------------------------------------------------------------------
from behave import given, when, then

@given('wir haben "behave" installiert')
def step_impl(context):
    context.execute_steps(u"Angenommen we have behave installed")

@when('wir einen Test implementieren')
def step_impl(context):
    context.execute_steps(u"Wenn we implement a test")

@then(u'wird "behave" ihn für uns testen!')
def step_impl(context):
    context.execute_steps(u'Dann behave will test it for us!')