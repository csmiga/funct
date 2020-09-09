# File: features/tutorial05_step_data.feature
#
# Tutorial 5: Multi-line Text (Step Data)
# https://jenisys.github.io/behave.example/tutorials/tutorial05.html
#
# Goal: Use multi-line text (with tripple-quoted text) for large text sections.
#
# Triple-quoted strings (ala Python docstrings) provide a possible to use large
# text section as step parameter. Normally, so much text would not fit on one
# line.

Feature: Step Data (tutorial05)

    Scenario: Some scenario
        Given a sample text loaded into the frobulator:
            """
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua.
            """
        When we activate the frobulator
        Then we will find it similar to English