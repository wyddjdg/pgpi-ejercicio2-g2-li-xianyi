CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -pedantic -std=c99 -Iinclude
TARGET  = bin/test_debouncer
SRCS    = src/debouncer.c src/test_debouncer.c
OBJS    = $(SRCS:.c=.o)

all: prepare $(TARGET)

prepare:
	@mkdir -p bin

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

valgrind: all
	valgrind --leak-check=full --show-leak-kinds=all --error-exitcode=1 ./$(TARGET)

clean:
	rm -rf bin src/*.o informe.txt

.PHONY: all prepare valgrind clean
