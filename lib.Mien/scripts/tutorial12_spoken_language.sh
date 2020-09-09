#! /usr/bin/env bash
#
# Tutorial 12: Use another Spoken Language
# https://jenisys.github.io/behave.example/tutorials/tutorial12.html
# 
# Goal: Use another spoken language for testing (other than English)

# Automatic language selection (via feature-file language marker):
#behave ../features/tutorial12_spoken_language.feature

# Explicit language selection via command-line usage of --lang=${lang}:
behave --lang=de ../features/tutorial12_spoken_language.feature