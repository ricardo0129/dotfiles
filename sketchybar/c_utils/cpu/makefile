CC=gcc
CFLAGS=-Wall
INSTALL_DIR=/usr/local/bin
TARGET=cpu_load

all: $(TARGET)

$(TARGET): cpu_load.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

install:
	cp $(TARGET) $(INSTALL_DIR)/$(TARGET)

uninstall:
	rm -f $(INSTALL_DIR)/$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all install uninstall clean
