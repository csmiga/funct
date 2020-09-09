# File: features/steps/blender.py
#
# Tutorial 3: Step Parameters
# https://jenisys.github.io/behave.example/tutorials/tutorial03.html
#
# Goal: Use step parameter to handover parameters to step functions.

# -----------------------------------------------------------------------------
# DOMAIN-MODEL:
# -----------------------------------------------------------------------------
class Blender(object):
    TRANSFORMATION_MAP = {
        "Red Tree Frog": "mush",
        "apples": "apple juice",
        "iPhone": "toxic waste",
        "Galaxy Nexus": "toxic waste",
    }
    def __init__(self):
        self.thing  = None
        self.result = None

    @classmethod
    def select_result_for(cls, thing):
        return cls.TRANSFORMATION_MAP.get(thing, "DIRT")

    def add(self, thing):
        self.thing = thing

    def switch_on(self):
        self.result = self.select_result_for(self.thing)
