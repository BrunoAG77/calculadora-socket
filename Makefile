server: server.c
    gcc -Wall -Wextra -O2 -o server server.c

client: client.c
    gcc -Wall -Wextra -O2 -o client client.c

all: server client

clean:
    rm -f server client
    
run-server:
    ./server 5001

run-client:
    ./client 127.0.0.1 5001
