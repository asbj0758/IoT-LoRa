# dragino lora testing
# Single lora testing app

CC=g++
CFLAGS=-c -Wall
LIBS=-lwiringPi

all: loraApp

loraApp: main.o
	$(CC) main.o  $(LIBS) -o loraApp

main.o: main.c
	$(CC) $(CFLAGS) main.c

clean:
	rm *.o loraApp	
