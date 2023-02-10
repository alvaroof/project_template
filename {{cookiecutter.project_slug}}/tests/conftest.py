# -*- coding: utf-8 -*-
"""Configuration file for pytest."""
import pytest


@pytest.fixture
def mike():
    """Simple return Mike."""
    return "Mike"
