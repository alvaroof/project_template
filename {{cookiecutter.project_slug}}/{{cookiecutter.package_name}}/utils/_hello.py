# -*- coding: utf-8 -*-
"""Demo module with dummy functionality."""


def say_hello_to(name: str) -> str:
    """Say hello to someone.

    >>> say_hello_to("Max")
    'hello Max'

    :param name: Dummy name.
    :return: A string saying "hello" to someone.
    """

    return f"hello {name}"
