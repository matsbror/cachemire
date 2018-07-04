CC = gcc

BASEDIR = ../../../../..
INCLUDEDIR = $(BASEDIR)/include
LIBDIR = $(BASEDIR)/lib

# Specifies the macro files
MACROS = $(LIBDIR)/c.m4.smacs $(LIBDIR)/c.m4.monmacs 

TARGET = RADIX
OBJS = radix.o
CFLAGS = -fvolatile -nostdinc -O2  -gdwarf -I$(INCLUDEDIR)
#CFLAGS = -O2 -Olimit 2000 -w
LDFLAGS = -nostdlib -static -L$(LIBDIR)  -lcg -lANL -lsys -lsolaris  $(LIBDIR)/start.o
#LDFLAGS = -lmpc -lm
#MACROS = ../../../null_macros/c.m4.null


x = *

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) -o $(TARGET) $(LDFLAGS)

.SUFFIXES:
.SUFFIXES:	.o .c .C .h .H

.H.h:
	m4 -s -Uindex ${MACROS} $*.H > $*.h

.C.c:
	m4 -s -Uindex $(MACROS) $*.C > $*.c

.c.o:
	$(CC) -c $(CFLAGS) $*.c

.C.o:
	m4 -s -Uindex $(MACROS) $*.C > $*.c
	$(CC) -c $(CFLAGS) $*.c

clean:
	-rm -f *.[cho] $(TARGET)

