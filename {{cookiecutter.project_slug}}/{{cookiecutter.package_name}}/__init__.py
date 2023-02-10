# -*- coding: utf-8 -*-
"""Top level package for {{cookiecutter.project_name}}."""
from importlib import metadata
from pathlib import Path


__version__ = metadata.version("{{cookiecutter.package_name}}")


# Base path of {{cookiecutter.package_name}} module
# (to be used when accessing non .py files in {{cookiecutter.project_name}}/)
BASEPATH = Path(__file__).parent
ASSET_DIR = BASEPATH / "assets"
