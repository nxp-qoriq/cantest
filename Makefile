CROSS_COMPILE ?=
DESTDIR ?=
CC := $(CROSS_COMPILE)gcc

EXEC = cantest
OBJS = cansend.o lib.o
PREFIX = $(DESTDIR)/usr/bin

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

install:
	install -m 755 $(EXEC) $(PREFIX)

romfs:
	$(ROMFSINST) -e CONFIG_USER_CAN_TEST /usr/bin/cantest

clean:
	-rm -f $(EXEC) *.elf *.gdb *.o
