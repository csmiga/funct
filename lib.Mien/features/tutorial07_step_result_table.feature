# File: features/tutorial07_step_result_table.feature
#
# Tutorial 7: Result Table
# https://jenisys.github.io/behave.example/tutorials/tutorial07.html
#
# Goal: Use result tables to simplify comparison of an expected dataset.
#
# The usage of result tables come in variations. It often depends what you want
# to compare. These variations in the test automation layer are:
#     * ordered dataset comparison
#     * unordered dataset comparison
#     * ordered subset comparison (result table contains subset)
#     * unordered subset comparison (result table contains subset)
#
# ------------------------------------------------------------------------------
# Hint: The FIT test framework provides similar concepts via Fixtures. An
#     extension of FIT, the FitLibrary, provides even more advanced fixtures
#     classes/tables.
#
# DatasetUnordered comparison    Ordered Comparison
# Subset                         fitlibrary.SubsetFixture, fit.RowFixture (with
#                                table args) fitlibrary.ArrayFixture (variant)
# Complete                       fit.RowFixture, fitlibrary.SetFixture 
#                                fitlibrary.ArrayFixture
#
# Besides other descriptions of these Fixtures, the Fixture Gallery project
# provides examples for these fixture in several languages.
# ------------------------------------------------------------------------------
#
# Both, unordered dataset comparison and unordered subset comparison are used in
# this tutorial in two different scenarios.

Feature: Step Result Table (tutorial07)

    Scenario: Unordered Result Table Comparison (RowFixture Table)
        Given a set of specific users:
            | name   | department  |
            | Alice  | Beer Cans   |
            | Bob    | Beer Cans   |
            | Charly | Silly Walks |
            | Dodo   | Silly Walks |
        Then we will have the following people in "Silly Walks":
            | name   |
            | Charly |
            | Dodo   |
        And we will have the following people in "Beer Cans":
            | name  |
            | Bob   |
            | Alice |

    Scenario: Subset Result Table Comparison
        Given a set of specific users:
            | name  | department       |
            | Alice | Super-sonic Cars |
            | Bob   | Super-sonic Cars |
        Then we will have at least the following people in "Super-sonic Cars":
            | name  |
            | Alice |