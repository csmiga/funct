# File: features/tutorial08_step_executes_steps.feature
#
# Tutorial 8: Execute Other Steps in a Step
# https://jenisys.github.io/behave.example/tutorials/tutorial08.html
#
# Goal: Reuse a sequence of existing steps as a step-macro.
#
# In some case, you want to replace a number of steps in a scenario by one
# simple macro step (macro functionality). To avoid code duplication in the test
# automation layer, the BDD framework normally provides a functionality to
# easily call these steps from within a step defintion.

Feature: Step executes other Steps (tutorial08)

    Scenario: Step by Step
        Given I start a new game
        When  I press the big red button
        And  I duck
        Then  I reach the next level

    Scenario: Execute multiple Steps in middle Step
        Given I start a new game
        When  I do the same thing as before
        Then  I reach the next level