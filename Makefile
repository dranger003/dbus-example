cc=gcc
CFLAGS=-g -c -Wall -m64 -Ofast -flto -march=native -funroll-loops -DLINUX -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include
#CFLAGS=-g -c -Wall -mthumb -O3 -march=armv7-a -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mvectorize-with-neon-quad -mfloat-abi=hard -DLINUX
LDFLAGS=-ldbus-1
SRCS=dbus-example.c
OBJS=$(SRCS:.c=.o)
TARGET=dbus-example

all: $(SRCS) $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -fr $(OBJS) $(TARGET)
