all: server client

server: server.c
	gcc -Wall -Wextra -O2 -o server server.c

client: client.c
	gcc -Wall -Wextra -O2 -o client client.c

clean:
	rm -f server client

run-server:
	./server 5001

run-client:
	./client 127.0.0.1 5001
