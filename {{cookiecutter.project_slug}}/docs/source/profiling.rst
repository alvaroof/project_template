.. highlight:: shell

=========
Profiling
=========

To get information about how any of the available scripts we use cProfile (from standars Python
libraries), snakeviz, gprof2dot and memory_profiler.

cProfile
--------

cProfile generates traces that are later used by the other tools.

To run cProfile on one script use the following command:

.. code-block:: console

    $ python -m cProfile -o <output-file> -m <script module> <script arguments>

To generate a trace to later be used by gprof2dot, generate a file with .pstats extension.

To generate a trace to later be used by snakeviz, generate a file with .prof extension.

gprof2dot
---------

gprof2dot generates a call graph from traces where the flow between function/method cols can be
visualized. The result is given in an image file.

To run gprof2dot to generate the call graph use the following command:

.. code-block:: console

    $ gprof2dot -f pstats <pstats file> | dot -Tpng -o <output file>


snakeviz
--------

snakeviz raises an interactive web application that allows to explore the time required to execute
every function/method in the traces.

To run snake viz to raise the execution explorer use the following command:

.. code-block:: console

    $ snakeviz <prof file>

memory_profiler
---------------

memory_profiler works differently from the previous tools. It is applied on top of a certain
function.

First, it requires to import the profile decorator in the module where the function is and use it on
said function, as seen in the following example:

.. code-block:: python

    # mprof_test.py
    import memory_profiler as mprof

    @mprof.profile
    def my_func():
        a = [1] * (10 ** 6)
        b = [2] * (2 * 10 ** 7)
        del b
        return a

    if __name__ == '__main__':
        my_func()

The next step is to run the module:

.. code-block:: console

    $ python -m mprof_test

The following output will be given, displaying memory use inside the profiled function:

.. code-block:: console

    Line #    Mem usage    Increment  Occurrences   Line Contents
    =============================================================
        3   38.816 MiB   38.816 MiB           1   @profile
        4                                         def my_func():
        5   46.492 MiB    7.676 MiB           1       a = [1] * (10 ** 6)
        6  199.117 MiB  152.625 MiB           1       b = [2] * (2 * 10 ** 7)
        7   46.629 MiB -152.488 MiB           1       del b
        8   46.629 MiB    0.000 MiB           1       return a
