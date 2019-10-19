#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
used by ``./bin/docker-build.sh`` file
"""

from __future__ import print_function
import os
import sys
import shutil
from os.path import join, dirname, basename, abspath, getmtime


class Style(object):
    RESET = "\033[0m"
    RED = "\033[31m"
    GREEN = "\033[32m"
    CYAN = "\033[36m"

here = dirname(abspath(__file__))
bin_dir = here
project_root_dir = dirname(here)


def raise_error():
    print(Style.RESET)
    exit(1)


if __name__ == "__main__":
    # print("=" * 80)
    # print(sys.argv)

    if not len(sys.argv[1].strip()):
        print(Style.RED + "you have to pass tag directory as the first argument!")
        raise_error()

    tag = sys.argv[1]
    build_context_dir = join(project_root_dir, tag)
    if not os.path.exists(build_context_dir):
        print(Style.RESET + "build context dir " + Style.CYAN + "'{}'".format(build_context_dir) + Style.RED + " not exists!")
        raise_error()

    dockerfile_path = join(build_context_dir, "Dockerfile")
    if not os.path.exists(dockerfile_path):
        print(Style.RESET + "Dockerfile " + Style.CYAN + "'{}'".format(dockerfile_path) + Style.RED + " not exists!")
        raise_error()
