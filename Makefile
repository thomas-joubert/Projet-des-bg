CXX=g++
CXXFLAGS= -Werror -Wall -Wextra -std=c++2a -lsfml-graphics -lsfml-window -lsfml-system -pedantic
LDFLAGS= -fsanitize=address
DEBUG= -g

SRC=src/object.cc src/character.cc src/obstacle.cc
OBJS=src/object.o src/character.o src/obstacle.o

TARGET=bin

all : $(TARGET)

check :
	$(CXX) $(TESTFLAGS) $(TESTSRC) -o check
	./check

debug :
	$(CXX) $(DEBUG) $(SRC) -o debug

$(TARGET) : $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	$(RM) $(TARGET) $(OBJS) debug check src/*.o *.o

.PHONY: clean check
