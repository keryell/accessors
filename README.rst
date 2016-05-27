Accessors: a C++ standard library class to qualify data accesses
================================================================

**Document number:** P0367R0

**Date:** 2016-05-30

**Project:** Programming Language C++, SG14, SG1, LEWG

**Authors:** Ronan Keryell (Xilinx), Lee Howes (Facebook)

Accessing data is the most important aspect when it comes to
high-performance computing or power efficiency in embedded
computing.

We propose to abstract data accesses through an accessor class to give
control to the programmer on how fine grain access is done, such as
caching, memory burst or remote access in heterogeneous computing.
