# https://jenisys.github.io/behave.example/tutorials/tutorial06.html
#
# file: features/tutorial06_step_setup_table.feature
#
# Goal: Use setup tables to simplify test setup.

Feature: Step Setup Table (tutorial06)

    Scenario: Setup Table
        Given a set of specific users:
            | name      | department  |
            | Barry     | Beer Cans   |
            | Pudey     | Silly Walks |
            | Two-Lumps | Silly Walks |
        When we count the number of people in each department
        Then we will find two people in "Silly Walks"
        But we will find one person in "Beer Cans"