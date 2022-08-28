default: build/task

DED_FLAGS = `cat flags.txt`

build/task: build/main.o build/process.o build/sort.o
	g++ $(DED_FLAGS) build/main.o build/process.o build/sort.o -o build/task

build/process.o: process.cpp process.h common.h
	g++ $(DED_FLAGS) -c process.cpp -o build/process.o

build/sort.o: sort.cpp sort.h common.h process.h
	g++ $(DED_FLAGS) -c sort.cpp -o build/sort.o

build/main.o: main.cpp common.h process.h sort.h
	g++ $(DED_FLAGS) -c main.cpp -o build/main.o