CC = gcc

BASEDIR = ../../../../..
INCLUDEDIR = $(BASEDIR)/include
LIBDIR = $(BASEDIR)/lib

# Specifies the macro files
MACROS = $(LIBDIR)/c.m4.smacs $(LIBDIR)/c.m4.monmacs 

TARGET = CHOLESKY
OBJS = amal.o assign.o bfac.o bksolve.o block2.o fo.o mf.o numLL.o \
     parts.o seg.o solve.o tree.o util.o malloc.o 

CFLAGS = -fvolatile -nostdinc -O2  -gdwarf -I$(INCLUDEDIR)
#CFLAGS = -O2 -Olimit 2000 -w
LDFLAGS = -nostdlib -static -L$(LIBDIR)  -lANL -lcg -lsys -lsolaris  $(LIBDIR)/start.o
#LDFLAGS = -lmpc -lm 
#MACROS = ../../null_macros/c.m4.null


x = *

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) -o $(TARGET) $(LDFLAGS)

.SUFFIXES:
.SUFFIXES:	.o .c .C .h .H

.H.h:
	m4 -s ${MACROS} $*.H > $*.h

.C.c:
	m4 -s $(MACROS) $*.C > $*.c

.c.o:
	$(CC) -c $(CFLAGS) $*.c

.C.o:
	m4 -s $(MACROS) $*.C > $*.c
	$(CC) -c $(CFLAGS) $*.c


matrix.h: matrix.H
amal.c: matrix.h
block2.c: matrix.h
numLL.c: matrix.h
tree.c: matrix.h
assign.c: matrix.h
fo.c: matrix.h
parts.c: matrix.h
util.c: matrix.h
bfac.c: matrix.h
malloc.c: matrix.h
seg.c: matrix.h
bksolve.c: matrix.h
mf.c: matrix.h
solve.c: matrix.h

clean:
	-rm -f *.[cho] $(TARGET)
