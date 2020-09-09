# File: features/tutorial11_tags.feature
#
# Tutorial 11: Use Tags
# https://jenisys.github.io/behave.example/tutorials/tutorial11.html
#
# ToDo: Add description with cucumber tag-expressions
# Goal: Understand the usage of tags to organize the testsuite and optimize test
#     runs.
#
# Tutorial 2: Natural Language
# https://jenisys.github.io/behave.example/tutorials/tutorial02.html
#
# Goal: Use natural language when writing tests.
#
# Several test frameworks support a concept of tags to mark a number of tests
# (py.test markers, TestNG test groups, JUnit Categories, NUnit
# CategoryAttribute). This provides a simple, flexible and effective mechanism
# to:
#     * select a number of tests
#     * exclude a number of tests
#
# for a test run. This mechanism is orthogonal to the static test package
# structure.
#
# HINT
# Predefined or often used tags:
# Tag      Kind            Description
# ---      ----            -----------
# @wip     predefined      “Work in Process” (under development).
# @skip    predefined      Skip/disable a feature, scenario, …
# @slow    user-defined    Mark slow, long-running tests.
#
# HINT
# Tag Logic:
# Logic Operation      Command Options            Description
# ---------------      ---------------            -----------
# select/enable        --tags=@one                Only items with this tag.
# not (tilde/minus)    --tags=~@one               Only items without this tag.
# logical-or           --tags=@one,@two           If @one or @two is present.
# logical-and          --tags=@one --tags=@two    If both @one and @two are
#                                                 present.
#
# Notes:
# The tag name prefix ‘@’ (AT) is optional in tag options
# Use --tags-help for a short description of the tag logic.
#
# See also behave tags documentation for more information on tags.

@wip
Feature: Using Tags with Features and Scenarios (tutorial11 := tutorial2)

    In order to increase the ninja survival rate,
    As a ninja commander
    I want my ninjas to decide whether to take on an opponent
    based on their skill levels.

    @ninja.any
    Scenario: Weaker opponent
        Given the ninja has a third level black-belt
        When attacked by a samurai
        Then the ninja should engage the opponent

    @ninja.chuck
    Scenario: Stronger opponent
        Given the ninja has a third level black-belt
        When attacked by Chuck Norris
        Then the ninja should run for his life