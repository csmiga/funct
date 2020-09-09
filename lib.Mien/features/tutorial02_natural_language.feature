# https://jenisys.github.io/behave.example/tutorials/tutorial02.html
#
# file: features/tutorial02_natural_language.feature
#
# Goal:	Use natural language when writing tests.
#
# Hint: This example is based on the Ninja Survival Rate examples
#     from [SecretNinja10].

Feature: Fight or Flight (Natural Language, tutorial02)

    In order to increase the ninja survival rate, As a ninja commander I want my
    ninjas to decide whether to take on an opponent based on their skill levels.

    Scenario: Weaker opponent
        Given the ninja has a third level black-belt
        When attacked by a samurai
        Then the ninja should engage the opponent

    Scenario: Stronger opponent
        Given the ninja has a third level black-belt
        When attacked by Chuck Norris
        Then the ninja should run for his life
