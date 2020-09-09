# File: features/steps/step_tutorial02.py
#
# Tutorial 2: Natural Language
# https://jenisys.github.io/behave.example/tutorials/tutorial02.html
#
# Goal: Use natural language when writing tests.
#
# Tutorial 9: Use Background
# https://jenisys.github.io/behave.example/tutorials/tutorial09.html
#
# Goal: Use the Background concept to execute a number of steps before each
#     scenario.
#
# Normally, the domain model is the
#
#    class-under-test (CUT)
#    subsystem-under-test
#    system-under-test (SUT)
#
# It contains the business logic that describes the behaviour of the system. The
# thin test automation layer from above (step definitions) just interacts with
# it. The domain model normally preexists (in another Python module/package) and
# you do not have to write it.

# @mark.domain_model
# ----------------------------------------------------------------------------
# PROBLEM DOMAIN:
# ----------------------------------------------------------------------------
class NinjaFight(object):
    """
    Domain model for ninja fights.
    """
    # pylint: disable=R0903

    def __init__(self, with_ninja_level=None):
        self.with_ninja_level = with_ninja_level
        self.opponent = None

    def decision(self):
        """
        Business logic how a Ninja should react to increase his survival rate.
        """
        assert self.with_ninja_level is not None
        assert self.opponent is not None
        if self.opponent == "Chuck Norris":
            return "run for his life"
        if "black-belt" in self.with_ninja_level:
            return "engage the opponent"
        else:
            return "run for his life"

# @mark.steps
# ----------------------------------------------------------------------------
# STEPS:
# ----------------------------------------------------------------------------
from behave   import given, when, then
from hamcrest import assert_that, equal_to, is_not

@given('the ninja has a {achievement_level}')
def step_the_ninja_has_a(context, achievement_level):
    context.ninja_fight = NinjaFight(achievement_level)

@when('attacked by a {opponent_role}')
def step_attacked_by_a(context, opponent_role):
    context.ninja_fight.opponent = opponent_role

@when('attacked by {opponent}')
def step_attacked_by(context, opponent):
    context.ninja_fight.opponent = opponent

@then('the ninja should {reaction}')
def step_the_ninja_should(context, reaction):
    assert_that(reaction, equal_to(context.ninja_fight.decision()))

# ----------------------------------------------------------------------------
# BACKGROUND-STEPS: Needed for tutorial09
# ----------------------------------------------------------------------------
@given('the ninja encounters another opponent')
def step_the_ninja_encounters_another_opponent(context):
    """
    BACKGROUND steps are called at begin of each scenario before other steps.
    """
    # -- SETUP/TEARDOWN:
    if hasattr(context, "ninja_fight"):
        # -- VERIFY: Double-call does not occur.
        assert_that(context.ninja_fight, is_not(equal_to(None)))
    context.ninja_fight = None