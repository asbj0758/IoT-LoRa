# dragino lora testing
# Single lora testing app

CC=g++
CFLAGS=-c -Wall
LIBS=-l wiringPi

all: lora_rec_app

lora_rec_app: main.o
	$(CC) main.o  $(LIBS) -o lora_rec_app

main.o: main.c
	$(CC) $(CFLAGS) main.c

clean:
	rm *.o lora_rec_app	
