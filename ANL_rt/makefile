CC = gcc
CPP = cpp

BASEDIR = .
LIBDIR = ../lib
INCLUDEDIR = ../include
CCFLAGS = -fvolatile  -I. -I$(INCLUDEDIR) -c -O2 -UDEBUG -nostdincl -gdwarf
MACROS = c.m4.smacs c.m4.monmacs 

OBJS = cm2.o asm.o shmem.o malloc.o

.SUFFIXES:
.SUFFIXES: .C .h .H .c .s .o .S
.H.h: ; m4 -s $(MACROS) $*.H >$*.h
.C.c: ; m4 -s $(MACROS) $*.C >$*.c
.c.s: ; $(CC) -S $(CCFLAGS) $*.c -o $*.s
.c.o: ; $(CC) $(CCFLAGS) $*.c -o $*.o
.s.o: ; $(CC) -c $*.s -o $*.o
.S.o: ; $(CC) -c $*.S -o $*.o
.C.o:
	m4 -s $(MACROS) $*.C > $*.c
	$(CC)  $(CCFLAGS) $*.c


all: $(OBJS)
	ar rv libANL.a $(OBJS) 

install: all
	-cp $(MACROS) $(LIBDIR)
	-cp cm2.h locks.h trap.h shmem.h attr.h $(INCLUDEDIR)
	-cp libANL.a $(LIBDIR)

clean:
	-rm -f $(OBJS) libANL.a


# Dependecies
