# File: features/tutorial01_basics.feature
#
# Tutorial 1: First Steps
# https://jenisys.github.io/behave.example/tutorials/tutorial01.html
#
# Goal: Show basics, make first steps
#
# The following feature file provides a simple feature with one scenario in the
# known Given ... When ... Then ... language style (BDD).
#
# To be able to execute the feature file, you need to provide a thin automation
# layer that represents the steps in the feature file with Python functions.
# These step functions provide the test automation layer (fixture code) that
# interacts with the system-under-test (SUT).

Feature: Showing off behave (tutorial01)

    Scenario: Run a simple test
        Given we have behave installed
        When we implement a test
        Then behave will test it for us!
