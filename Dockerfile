FROM amd64/ubuntu:trusty
LABEL maintainer Serhii Kocherha <serj911kocherga@gmail.com>
RUN apt-get update -y
RUN apt-get upgrade -y 
RUN apt-get -qq update && apt-get install -qy g++ gcc libboost-all-dev
COPY . .

RUN g++ -o server main.cpp connection_manager.cpp connection.cpp mime_types.cpp reply.cpp request_handler.cpp request_parser.cpp server.cpp -lboost_system -lboost_thread -lpthread -std=c++11 -I/usr/include/boost
EXPOSE 8080
CMD ./server 0.0.0.0 8080 .





