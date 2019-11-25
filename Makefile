CFLAGS+=	-W -Wall -O2 -std=c99 -g -pedantic
CFLAGS+=	-I/usr/local/include
LDFLAGS+=	-lnanomsg
LDFLAGS+=	-L/usr/local/lib

all: nanologger nanoclient

nanologger: $@.c
	$(CC) ${CFLAGS} -o $@ ${@}.c ${LDFLAGS}

nanoclient: $@.c client.c client.h
	$(CC) ${CFLAGS} -o $@ ${@}.c client.c ${LDFLAGS}

clean:
	rm -f nanologger nanoclient 
	rm -rf a.out *.BAK *.core

cleanlogs: clean
	rm -rf nlog.txt log.txt

.PHONY: clean cleanlogs 

