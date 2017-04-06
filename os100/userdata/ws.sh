#!/bin/sh
X="Hello world from `hostname` server!\n"
nohup nc -lk -p 80 -e echo -ne "HTTP/1.0 200 OK\r\nContent-Length: ${#X}\r\n\r\n${X}\r\n" &

