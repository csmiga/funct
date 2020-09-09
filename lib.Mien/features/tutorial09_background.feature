# File: features/tutorial09_background.feature
#
# Tutorial 9: Use Background
# https://jenisys.github.io/behave.example/tutorials/tutorial09.html
#
# Goal: Use the Background concept to execute a number of steps before each
#     scenario.
#
# Hint: This example is based on the Ninja Survival Rate examples
#     from [SecretNinja10].

Feature: Using Background -- Fight or Flight (Natural Language Part2, tutorial09)

    Background: Ninja fight setup
        Given the ninja encounters another opponent

    Scenario: Weaker opponent
        Given the ninja has a third level black-belt
        When attacked by a samurai
        Then the ninja should engage the opponent

    Scenario: Stronger opponent
        Given the ninja has a second level black-belt
        When attacked by Chuck Norris
        Then the ninja should run for his life