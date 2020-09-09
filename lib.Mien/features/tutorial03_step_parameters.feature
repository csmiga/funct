# Tutorial 3: Step Parameters
# https://jenisys.github.io/behave.example/tutorials/tutorial03.html
#
# file: features/tutorial03_step_parameters.feature
#
# Goal: Use step parameter to handover parameters to step functions.
#
# The feature description contains a number of parameters, where different
# values can be filled in. This also makes the test automation layer much
# simpler, because the number of step definitions is reduced.
#
# Best Practice: Put parameters in double-quoted text to make variation-points
#     visible. The test runner output does not have this problem, because it
#     often marks these parameters as bold text.

Feature: Step Parameters (tutorial03)

    Scenario: Blenders
        Given I put "apples" in a blender
        When  I switch the blender on
        Then  it should transform into "apple juice"
