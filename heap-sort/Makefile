CC := clang
CFLAGS := -g
FRAMEWORKS := -framework Foundation
BUILD_DIR := build
SOURCES := Heap.m main.m
HEADERS := $(SOURCES:%.m=%.h)
OBJECTS := $(addprefix $(BUILD_DIR)/,$(SOURCES:%.m=%.o))
EXEC := $(BUILD_DIR)/heapsort
RM := rm -rf
NOOP := 

all: $(SOURCES) $(EXEC)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(EXEC): $(OBJECTS)
	$(CC) $(CFLAGS) $(FRAMEWORKS) $(OBJECTS) -o $@

$(OBJECTS): $(HEADERS) | $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.m
	$(CC) $(CFLAGS) -c $< -o $@

%.h:
	$(NOOP)

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(EXEC) $(BUILD_DIR)
