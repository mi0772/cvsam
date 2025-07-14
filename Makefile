CC = gcc
CFLAGS = -Wall -Wextra -O2 -Iinclude

SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
TARGET = bin/vsam

all: $(TARGET)

$(TARGET): $(OBJ)
	mkdir -p bin
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf bin *.o src/*.o
