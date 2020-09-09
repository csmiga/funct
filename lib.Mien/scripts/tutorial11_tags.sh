#! /usr/bin/env bash
#
# File: features/tutorial11_tags.sh
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

# When you run the feature file by excluding the tag @wip, then any feature
# marked with this tag is skipped as well as all of its scenarios.
behave --tags=-wip ../features/tutorial11_tags.feature

# Note: Check the test summary for the skipped count for features and scenarios.

# When you enable the tag @ninja.chuck:
#behave --tags=ninja.chuck ../features/tutorial11_tags.feature

# Note: Now only the second scenario is executed and the first one is skipped.

# When you disable the tag @ninja.chuck:
#behave --tags=-ninja.chuck ../features/tutorial11_tags.feature

# Note: Now both scenarios are executed.

# When you select items that have the tag @ninja.any and the
# tag @ninja.chuck (tag-and):
#behave --tags=@ninja.any --tags=@ninja.chuck ../features/tutorial11_tags.feature

# Note: Now no scenario is executed, all are skipped.
