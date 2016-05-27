Accessors: a C++ standard library class to qualify data accesses
================================================================

**Document number:** P0367R0

**Date:** 2016-05-30

**Project:** Programming Language C++, SG14, SG1, LEWG

**Authors:** Ronan Keryell (Xilinx), Lee Howes (Facebook)

Accessing data is the most important aspect when it comes to
high-performance computing or power efficiency in embedded computing.

We propose to abstract data accesses through an accessor class to give
control to the programmer on how fine grain access is done, such as
caching, memory burst or remote access in heterogeneous computing.

The ``std::accessor<>`` class is a proxy wrapper that behaves like the
wrapped object but adds access properties to it or change the access
behaviour.

For example if you have a slow I/O or a memory access (a special case
of slow I/O nowadays...) but you know that pretty often the result is
42 for obvious reasons, you may rewrite your code

.. code:: c++

  auto result = f(some_io());

to

.. code:: c++

  auto result = f(make_accessor<likely> { some_io(), 42 });

and the compiler can decide for example to clone the execution of
``f`` to compute ahead ``f(42)`` or even to ``constexpr``-evaluate it
and the result is only committed when ``some_io()`` comes back and the
value is verified as predicted. If not, the normal evaluation of
``f()`` goes on.