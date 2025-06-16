CXX=g++
CXXFLAGS=-std=c++17

all: ./task
	
run: ./task
	./task < input.txt

./task: template.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -f ./task
