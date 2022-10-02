all: main

CC = clang
override CFLAGS += -g -Wall -Wpedantic -Werror=vla -std=gnu2x -pthread -lm

SRCS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print)

main: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o "$@"

main-debug: $(SRCS)
	$(CC) $(CFLAGS) -O0 $(SRCS) -o "$@"

clean:
	rm -f main main-debug