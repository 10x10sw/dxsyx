CC=g++
CFLAGS=-c -Wall -std=gnu++11
LDFLAGS=
SOURCES=dxsyx/main.cpp dxsyx/dxsyx.cpp dxsyx/mk2syx.cpp
INCLUDES=dxsyx/dxsyx.h dxsyx/mk2syx.h
OBJECTS=$(SOURCES:.cpp=.o)
OUT_DIR=bin
EXECUTABLE=$(OUT_DIR)/dxsyx
MKDIR_P = mkdir -p

.PHONY: directories test

all: directories $(SOURCES) $(EXECUTABLE)

directories: ${OUT_DIR}

${OUT_DIR}:
	${MKDIR_P} ${OUT_DIR}

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

test:
	cd test && make

clean:
	rm $(OBJECTS) $(EXECUTABLE) && cd test && make clean
