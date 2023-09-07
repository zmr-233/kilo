all: kilo

kilo: kilo.c
	$(CC) -g -O0 -o kilo kilo.c -Wall -W -pedantic -std=c99

clean:
	rm kilo
