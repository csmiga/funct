#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# USAGE: convert_i18n_yaml.py [--data=i18n.yml] behave/i18n.py
"""
Generates I18N python module based on YAML description (i18n.yml).

REQUIRES:
  * argparse
  * six
  * PyYAML
"""

from __future__ import absolute_import, print_function
import argparse
import os.path
import six
import sys
import pprint
import yaml

HERE = os.path.dirname(__file__)
NAME = os.path.basename(__file__)
__version__ = "1.0"

def yaml_normalize(data):
    for part in data:
        keywords = data[part]
        for k in keywords:
            v = keywords[k]
            # bloody YAML parser returns a mixture of unicode and str
            if not isinstance(v, six.text_type):
                v = v.decode("UTF-8")
            keywords[k] = v.split("|")
    return data

def main(args=None):
    if args is None:
        args = sys.argv[1:]
    parser = argparse.ArgumentParser(prog=NAME,
                description="Generate python module i18n from YAML based data")
    parser.add_argument("-d", "--data", dest="yaml_file",
                default=os.path.join(HERE, "i18n.yml"),
                help="Path to i18n.yml file (YAML file).")
    parser.add_argument("output_file", default="stdout",
                help="Filename of Python I18N module (as output).")
    parser.add_argument("--version", action="version", version=__version__)

    options = parser.parse_args(args)
    if not os.path.isfile(options.yaml_file):
        parser.error("YAML file not found: %s" % options.yaml_file)

    # -- STEP 1: Load YAML data.
    languages = yaml.load(open(options.yaml_file))
    languages = yaml_normalize(languages)

    # -- STEP 2: Generate python module with i18n data.
    contents = u"""# -*- coding: UTF-8 -*-
# -- FILE GENERATED BY: convert_i18n_yaml.py with i18n.yml
# pylint: disable=line-too-long

languages = \\
"""
    if options.output_file in ("-", "stdout"):
        i18n_py = sys.stdout
        should_close = False
    else:
        i18n_py = open(options.output_file, "w")
        should_close = True
    i18n_py.write(contents.encode("UTF-8"))
    i18n_py.write(pprint.pformat(languages).encode("UTF-8"))
    i18n_py.write(u"\n")
    if should_close:
        i18n_py.close()
    return 0

if __name__ == "__main__":
    sys.exit(main())