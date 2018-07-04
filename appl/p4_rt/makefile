CC = gcc

BASEDIR = ..
LIBDIR = $(BASEDIR)/lib
INCLUDEDIR = $(BASEDIR)/include
CCFLAGS = -pipe -fvolatile  -I.  -c -UDEBUG -O2 -gdwarf
TARGET = libp4.a
OBJS = p4.o p4_mon.o p4_util.o util.o asm.o shmem.o malloc.o 

.SUFFIXES:
.SUFFIXES: .h .c .s .o .S
.c.s: ; $(CC) -S $(CCFLAGS) $*.c -o $*.s
.c.o: ; $(CC) $(CCFLAGS) $*.c -o $*.o
.s.o: ; $(CC) -c $*.s -o $*.o
.S.o: ; $(CC) -c $*.S -o $*.o


all: $(OBJS)
	ar rv $(TARGET) $(OBJS) 

install: all
	-cp p4.h p4_mon.h p4_sys.h alog.h trap.h $(INCLUDEDIR)
	-cp $(TARGET) $(LIBDIR)

clean:
	-rm $(OBJS) $(TARGET)


# Dependecies
p4.o: p4.h p4_sys.h p4_mon.h shmem.h attr.h trap.h asm.S
p4_mon.o: p4.h p4_sys.h p4_mon.h shmem.h attr.h trap.h asm.S
asm.o: trap.h
shmem.o: asm.S attr.h p4.h p4_mon.h
p4_util.o: p4.h p4.c p4_sys.h
