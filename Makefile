CC=gcc
CFLAGS=
INCLUDE=-I./include 
INCLUDE+=-I../librusb/src
LDFLAGS=
LDFLAGS+=-Lrusb

SOURCES=
SRC_LIB=
OBJ_LIB=
SRC_UTILS=
OBJ_UTILS=

BUILD_DIR=build/

include src/make.mk


OBJECTS=$(SOURCES:.c=.o)

utils: $(DIR)-pre $(OBJ_UTILS)

all: $(OBJECTS)

make: $(OBJECTS)
	echo $(OBJECTS)
	echo $(SRC_LIB)


%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -Wl,-rpath=. -c $< -o $(BUILD_DIR)$@

clean:
	rm -rf build/src/rtl_*
