CXX=g++
CXXSTD=-std=c++11
CXXFLAGS=$(CXXSTD) -Wall -Wextra -pedantic -g -fPIC
LDFLAGS=-shared

all: div.so

div.so:
	$(CXX) $(CXXFLAGS) $(LDFLAGS) div.cpp -o $@

clean:
	rm -rf div.so	
	rm -rf div.o	
	rm -rf div.lo	
