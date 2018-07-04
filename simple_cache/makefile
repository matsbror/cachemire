CC = CC

C_LIB = ../c2
HDRS_LIB = $(C_LIB)

SRC  	= main.cc cache.cc 
OBJS	= main.o cache.o ../c2/cm_memory.o ../c2/syscall.o
LIBS 	= -lc

TARGET	= cm2_c

#  OPTIONS to simulator

#  -DLRU_REPL    uses LRU as block replacement policy
#  -ULRU_REPL    uses random block replacement policy

OPT= -O4 
#OPT= -O4 -xF
CCFLAGS =  $(OPT) -c -I$(HDRS_LIB) -ULRU_REPL -ptr$(C_LIB) -UTRACE_ALL
LDFLAGS =   $(OPT) -I. -I$(HDRS_LIB) -ptr$(C_LIB)
LIBS = -lcm2s -lm -lelf

.SUFFIXES: .cc .o
.cc.o: ; $(CC) $(CCFLAGS) $*.cc -o $*.o

all: $(OBJS) 
	$(CC) $(LDFLAGS) $(OBJS) -L$(C_LIB) -o $(TARGET) $(LIBS) 

clean:
	-rm -f *.o $(TARGET1) $(TARGET2)


# Dependecies

main.cc: makefile
main.o: $(HDRS_LIB)/cachemire-2.h
cache.o: cache.h $(HDRS_LIB)/cachemire-2.h
