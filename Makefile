CC=g++

PROG=vampeyer
VERSION=0.1
PREFIX=/usr
SOURCES=VampHost.cpp VisHost.cpp PNGWriter.cpp GUI.cpp Vampeyer.cpp
CFLAGS=-c -g -Wall
LDFLAGS=-ldl -lpng -lsndfile -lvamp-hostsdk -lfltk
OBJECTS=$(SOURCES:.cpp=.o)

all: $(PROG)

$(PROG): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS) $(PROG)

install: all
	install -D -m 0755 $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)

package:
	tar -czf ../vampeyer_$(VERSION).orig.tar.gz .
	dpkg-buildpackage
