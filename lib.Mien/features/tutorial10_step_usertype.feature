# File: features/tutorial10_step_usertype.feature
#
# Tutorial 10: User-defined Data Type
# https://jenisys.github.io/behave.example/tutorials/tutorial10.html
#
# Goal: Show how user-defined data types can be used in step parameters.
#
# User-defined data types simplify the processing in step definitions. The
# string parameters are automatically parsed and converted into specific data
# types.
#
# Note: Besides conversion into a user-defined type, this mechanism can also be
#     used for text transformations that occurs before the parameter is handed
#     to the step definition function.
#
#     Predefined Types:
#     behave uses the parse module (inverse of Python string.format) under the
#     hoods to parse parameters in step definitions. This leads to rather simple
#     and readable parse expressions for step parameters.
#
#     See also Predefined Data Types in parse for more information. In addition,
#     see also Data Types and User-defined Types for more information on
#     defining and using user-defined data types.

Feature: User-Defined Datatype as Step Parameter (tutorial10)

    As a test writer
    I want that a step parameter is converted into a specific datatype
    to simplify the programming of the step definition body.

    Scenario Outline: Calculator
        Given I have a calculator
        When I add "<x>" and "<y>"
        Then the calculator returns "<sum>"

        Examples:
            | x | y | sum |
            | 1 | 1 | 2   |
            | 1 | 2 | 3   |
            | 2 | 1 | 3   |
            | 2 | 7 | 9   |