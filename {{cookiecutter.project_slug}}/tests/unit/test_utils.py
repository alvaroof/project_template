# -*- coding: utf-8 -*-
"""Example test file (consider removing it)."""
from {{cookiecutter.package_name}}.utils import say_hello_to
from {{cookiecutter.package_name}} import __version__
import importlib.metadata as im


def test_hello_world(mike):
    """Dummy test function."""
    assert say_hello_to(mike) == "hello Mike"


def test_version_compatibility():
    """Test that versions in __init__ and in pyproject.toml are the same"""
    assert im.version("{{cookiecutter.package_name}}") == __version__
