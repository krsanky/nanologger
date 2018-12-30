CFLAGS +=		-W -Wall -O2 -std=c99 -g
LDFLAGS = -lnanomsg

all: nanologger nanoclient

nanologger: ${.TARGET}.c
	$(CC) $(CFLAGS) -o ${.TARGET} \
		${.TARGET}.c \
		-L/usr/local/lib -I/usr/local/include \
		$(LDFLAGS)

nanoclient: ${.TARGET}.c
	$(CC) $(CFLAGS) -o ${.TARGET} \
		${.TARGET}.c \
		client.c \
		-L/usr/local/lib -I/usr/local/include \
		-lnanomsg

test:
	@echo CURDIR:${.CURDIR}
	@echo TARGET:${.TARGET} [should be 'test']

clean:
	rm -f writef myserver nanologger nanoclient mdtest params_test
	rm -rf a.out *.BAK *.cgi *.core
cleanlogs: clean
	rm -rf nlog.txt log.txt

.PHONY: test clean cleanlogs indent

