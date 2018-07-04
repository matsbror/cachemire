CC = CC
#CC = gcc

HDRS	= cm_memory.h cachemire-2.h sparcp.h sparc.h codes.h trap.h generics.h lists.h statistics.h rand_gen.h bitvec.h loadfile.h sparse_array.h
SRC  	= cm_memory.cc sparc.cc syscall.c lists.cc statistics.cc rand_gen.cc bitvec.cc loadfile.cc 
LIBS 	= -lc
OBJS	= syscall.o sparc.o lists.o  rand_gen.o bitvec.o loadfile.o 

#OPT =  -g
OPT =  -O4 
#OPT =  -O4 -xF
CCFLAGS = $(OPT) -I. -c -UFP_DEBUG -UTMP_DEBUG

.SUFFIXES: .cc .c .o
.cc.o: ; $(CC) $(CCFLAGS) $*.cc -o $*.o
.c.o: ; $(CC) $(CCFLAGS) $*.c -o $*.o

common: $(OBJS) statistics.o cm_memory.o
	ar rv libcm2.a $(OBJS)
	ar rv libcm2s.a $(OBJS) statistics.o

clean:
	-rm -rf Templates.DB
	-rm -f  $(OBJS) $(TARGET) statistics.o cm_memory.o *~



# Dependecies

cm_memory.o: cachemire-2.h cm_memory.h lists.o generics.h statistics.h sparse_array.h pagetable.h
loadfile.o: cachemire-2.h cm_memory.h loadfile.h 
sparc.o: sparcp.h sparc.h codes.h cm_memory.h syscall.h trap.h
trap.o: sparcp.h trap.h trapc.h generics.h cm_memory.h cachemire-2.h 
lists.o: lists.h
statistics.o: statistics.cc statistics.h generics.h 
rand_gen.o: rand_gen.h
