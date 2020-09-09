# File: features/tutorial01_basics.feature
#
# Tutorial 1: First Steps
# https://jenisys.github.io/behave.example/tutorials/tutorial01.html
#
# Goal: Show basics, make first steps

Feature: Showing off behave (tutorial01)

    Scenario: Run a simple test
        Given we have behave installed
        When we implement a test
        Then behave will test it for us!
