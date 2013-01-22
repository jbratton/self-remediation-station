#import <Foundation/Foundation.h>
#import "Heap.h"

int const DEFAULT_HEAP_SIZE = 16;

@implementation Heap

- (id)init {
	return [self initWithHeapSize:DEFAULT_HEAP_SIZE];
}

- (id)initWithHeapSize:(int)size {
	_heapSize = size;
	heapArray = (id *)malloc(sizeof(id) * _heapSize);

	if (heapArray == NULL) {
		NSLog(@"wtf, man -- couldn't malloc for a new Heap");
		exit(-1);
	}
	return self;
}

- (id)initWithArray:(NSArray *)array {
	[self initWithHeapSize:[array count]];

	for (int i = 0; i < _heapSize; i++) {
		heapArray[i] = [array objectAtIndex:i];
	}

	for (int i = _heapSize/2 - 1; i >= 0; i--) {
		[self heapifyAtIndex:i];
	}
	return self;
}

- (int)parent:(int)index { return index/2; }
- (int)left:(int)index { return index*2; }
- (int)right:(int)index { return index*2+1; }

- (void)heapify {
	[self heapifyAtIndex:0];
}

- (void)heapifyAtIndex:(int)idx {
	int lastIndex = idx;
	int index = idx;
	
	do {
		lastIndex = index;
		index = [self heapifyOnceAtIndex:index];
	} while (index != lastIndex);
}

- (int)heapifyOnceAtIndex:(int)index {
	int largest;
	int left = [self left:index];
	int right = [self right:index];
	if (left <= _heapSize && [heapArray[left] compare:heapArray[index]] == NSOrderedDescending)
		largest = left;
	else
		largest = index;

	if (right <= _heapSize && [heapArray[right] compare:heapArray[largest]] == NSOrderedDescending)
		largest = right;

	if (largest != index) {
		id temp = heapArray[index];
		heapArray[index] = heapArray[largest];
		heapArray[largest] = temp;
	}

	return largest;
}

- (void)growArray:(int)newSize {
	id *newHeapArray = (id *)malloc(sizeof(id) * newSize);
	if (newHeapArray == NULL) {
		NSLog(@"ran out of memory to grow heapArray");
		exit(-1);
	}
	for (int i = 0; i < _heapSize; i++) {
		newHeapArray[i] = heapArray[i];
	}
	free(heapArray);
	heapArray = newHeapArray;
	_heapSize = newSize;
}

- (void)dealloc {
	if (heapArray) free(heapArray);
	heapArray = NULL;
}

- (NSString *)description {
	NSString *desc = [NSMutableString new];
	[desc appendFormat:@"%@", heapArray[0]];
	for (int i = 1; i < _heapSize; i++) {
		[desc appendFormat:@", %@", heapArray[i]];
	}
	return desc;
}

@end
