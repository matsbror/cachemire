
THE CACHEMIRE TEST BENCH
------------------------

Directories c2 and simple_cache contains the source code to
build a functional shared memory multiprocessor simulator
with a very simple cache memory simulator.

If you want to build your own memory system simulators, you
need not touch the files in directory c2.

Directory appl contains runtime support to build parallel
applications using p4. 

There is a test application that performs matrix multiplication.

The CacheMire test bench has only been tested on Sun computers
running SunOS 5.2 or later. It uses the elf format for application
binaries. By changing c2/loadfile.cc it should be possible to use
other formats such as a.out.

Disclaimer
----------

The CacheMire group takes no responsibility whatsoever regarding the
usefulness of the program. The source code is provided "as is" and 
we regret that we are unable to answer any questions.

If you find the program useful we would like to know about it.
If you publish work in which you have used the CacheMire test bench
we would like you to refer to the followin paper:

M. Brorsson, F. Dahlgren, H. Grahn, and P. Stenström, "The CacheMire Bench - A Flexible and Effective
Approach for Simulation of Multiprocessors", In Proceedings of the
26th Annual International Simulation Symposium, pp. 41-49, March 1993.

The paper is included in the file simsymp.{ps,pdf}

