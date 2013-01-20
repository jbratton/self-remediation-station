CC := clang
FRAMEWORKS := -framework Foundation
BUILD_DIR := build
SOURCES := MergeSort.m main.m
OBJECTS := $(addprefix $(BUILD_DIR)/,$(SOURCES:%.m=%.o))
EXEC := $(BUILD_DIR)/mergesort
RM := rm -rf

all: $(SOURCES) $(EXEC)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(EXEC): $(OBJECTS) | $(BUILD_DIR)
	$(CC) $(FRAMEWORKS) $(OBJECTS) -o $@

$(BUILD_DIR)/%.o: %.m %.h
	$(CC) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(EXEC) $(BUILD_DIR)
