# -*- coding: UTF-8 -*-
# FILE: issue.features/environemnt.py
# pylint: disable=unused-argument
"""
Functionality:

  * active tags
"""


from __future__ import absolute_import, print_function
import sys
import platform
import os.path
import six
from behave.tag_matcher import ActiveTagMatcher
from behave4cmd0.setup_command_shell import setup_command_shell_processors4behave
# PREPARED: from behave.tag_matcher import setup_active_tag_values


# ---------------------------------------------------------------------------
# TEST SUPPORT: For Active Tags
# ---------------------------------------------------------------------------
def require_tool(tool_name):
    """Check if a tool (an executable program) is provided on this platform.

    :params tool_name:  Name of the tool to check if it is available.
    :return: True, if tool is found.
    :return: False, if tool is not available (or not in search path).
    """
    # print("CHECK-TOOL: %s" % tool_name)
    path = os.environ.get("PATH")
    if not path:
        return False

    for searchdir in path.split(os.pathsep):
        executable1 = os.path.normpath(os.path.join(searchdir, tool_name))
        executables = [executable1]
        if sys.platform.startswith("win"):
            executables.append(executable1 + ".exe")

        for executable in executables:
            # print("TOOL-CHECK: %s" % os.path.abspath(executable))
            if os.path.isfile(executable):
                # print("TOOL-FOUND: %s" % os.path.abspath(executable))
                return True
    # -- OTHERWISE: Tool not found
    # print("TOOL-NOT-FOUND: %s" % tool_name)
    return False


def as_bool_string(value):
    if bool(value):
        return "yes"
    else:
        return "no"


def discover_ci_server():
    # pylint: disable=invalid-name
    ci_server = "none"
    CI = os.environ.get("CI", "false").lower() == "true"
    APPVEYOR = os.environ.get("APPVEYOR", "false").lower() == "true"
    TRAVIS = os.environ.get("TRAVIS", "false").lower() == "true"
    if CI:
        if APPVEYOR:
            ci_server = "appveyor"
        elif TRAVIS:
            ci_server = "travis"
        else:
            ci_server = "unknown"
    return ci_server


# ---------------------------------------------------------------------------
# BEHAVE SUPPORT: Active Tags
# ---------------------------------------------------------------------------
# -- MATCHES ANY TAGS: @use.with_{category}={value}
# NOTE: active_tag_value_provider provides category values for active tags.
python_version = "%s.%s" % sys.version_info[:2]
active_tag_value_provider = {
    "platform": sys.platform,
    "python2": str(six.PY2).lower(),
    "python3": str(six.PY3).lower(),
    "python.version": python_version,
    # -- python.implementation: cpython, pypy, jython, ironpython
    "python.implementation": platform.python_implementation().lower(),
    "pypy":    str("__pypy__" in sys.modules).lower(),
    "os":      sys.platform,
    "xmllint": as_bool_string(require_tool("xmllint")),
    "ci": discover_ci_server()
}
active_tag_matcher = ActiveTagMatcher(active_tag_value_provider)


def print_active_tags_summary():
    active_tag_data = active_tag_value_provider
    print("ACTIVE-TAG SUMMARY:")
    print("use.with_python.version=%s" % active_tag_data.get("python.version"))
    # print("use.with_platform=%s" % active_tag_data.get("platform"))
    # print("use.with_os=%s" % active_tag_data.get("os"))
    print()


# ---------------------------------------------------------------------------
# BEHAVE HOOKS:
# ---------------------------------------------------------------------------
def before_all(context):
    # -- SETUP ACTIVE-TAG MATCHER (with userdata):
    # USE: behave -D browser=safari ...
    # NOT-NEEDED:
    # setup_active_tag_values(active_tag_value_provider, context.config.userdata)
    setup_command_shell_processors4behave()
    print_active_tags_summary()


def before_feature(context, feature):
    if active_tag_matcher.should_exclude_with(feature.tags):
        feature.skip(reason=active_tag_matcher.exclude_reason)


def before_scenario(context, scenario):
    if active_tag_matcher.should_exclude_with(scenario.effective_tags):
        scenario.skip(reason=active_tag_matcher.exclude_reason)