CC = gcc
LD = gcc
RM = rm

INCLUDEDIR = ../include
LIBDIR     = ../lib

LIBS = -lp4 -lcg -lsys -lsolaris $(LIBDIR)/start.o

CFLAGS     = -I$(INCLUDEDIR) -fvolatile -O2 -gdwarf -nostdinc
LDFLAGS    = -static -L$(LIBDIR) -nostdlib

.SUFFIXES:	.o .c .h

.c.o:$(P)
	$(CC) $(CFLAGS) -c $*.c 
.c.s:$(P)
	$(CC) -S $(CFLAGS) -c $*.c 

all:$(P)
	make mult


mult:$(P)   mult.o;
	$(LD) $(LDFLAGS) -o mult mult.o $(LIBS) 

links:  all
	-rm -f mult1 mult2 mult3 mult4 mult5
	-rm -f multi1 multi2 multi3 multi4 multi5
	-rm -f multb1 multb2 multb3 multb4 multb5
	-rm -f multm1 multm2 multm3 multm4 multm5
	ln -s mult mult1
	ln -s mult mult2
	ln -s mult mult3
	ln -s mult mult4
	ln -s mult mult5
	ln -s mult multm1
	ln -s mult multm2
	ln -s mult multm3
	ln -s mult multm4
	ln -s mult multm5
	ln -s mult multb1
	ln -s mult multb2
	ln -s mult multb3
	ln -s mult multb4
	ln -s mult multb5
	ln -s mult multi1
	ln -s mult multi2
	ln -s mult multi3
	ln -s mult multi4
	ln -s mult multi5

clean:
	-rm -f *.o mult 




