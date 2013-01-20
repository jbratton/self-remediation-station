CC := clang
FRAMEWORKS := -framework Foundation
BUILD_DIR := build
SOURCES := MergeSort.m main.m
HEADERS := $(SOURCES:%.m=%.h)
OBJECTS := $(addprefix $(BUILD_DIR)/,$(SOURCES:%.m=%.o))
EXEC := $(BUILD_DIR)/mergesort
RM := rm -rf
NOOP := 

all: $(SOURCES) $(EXEC)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(EXEC): $(OBJECTS)
	$(CC) $(FRAMEWORKS) $(OBJECTS) -o $@

$(OBJECTS): $(HEADERS) | $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.m
	$(CC) -c $< -o $@

%.h:
	$(NOOP)

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(EXEC) $(BUILD_DIR)
