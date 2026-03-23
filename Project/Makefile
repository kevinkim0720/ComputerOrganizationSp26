CC = arm-linux-gnueabi-gcc
CFLAGS = -Wall -g

TARGET = rsa_program

SRCS = src/main.s src/rsa_lib.s
OBJS = $(SRCS:.s=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
