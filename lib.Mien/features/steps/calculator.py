# File: features/steps/calculator.py
#
# Tutorial 10: User-defined Data Type
# https://jenisys.github.io/behave.example/tutorials/tutorial10.html
#
# Goal: Show how user-defined data types can be used in step parameters.

# -----------------------------------------------------------------------------
# DOMAIN-MODEL:
# -----------------------------------------------------------------------------
class Calculator(object):

    def __init__(self, value=0):
        self.result = value

    def reset(self):
        self.result = 0

    def add2(self, x, y):
        self.result += (x + y)
        return self.result