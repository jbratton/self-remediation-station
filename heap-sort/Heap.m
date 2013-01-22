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
	[self buildHeap];

	return self;
}

- (int)parent:(int)index { return (index-1)/2; }
- (int)left:(int)index { return index*2+1; }
- (int)right:(int)index { return index*2+2; }

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
	if (left < _heapSize && [heapArray[left] compare:heapArray[index]] != NSOrderedAscending)
		largest = left;
	else
		largest = index;

	if (right < _heapSize && [heapArray[right] compare:heapArray[largest]] != NSOrderedAscending)
		largest = right;

	if (largest != index) {
		[self swapElementsAtIndex:index andIndex:largest];
	}

	return largest;
}

- (void)swapElementsAtIndex:(int)idx_a andIndex:(int)idx_b {
	id temp = heapArray[idx_a];
	heapArray[idx_a] = heapArray[idx_b];
	heapArray[idx_b] = temp;
}

- (void)buildHeap {
	for (int i = _heapSize/2-1; i >= 0; i--) {
		[self heapifyAtIndex:i];
	}
}

- (void)sortHeap {
	int actualHeapSize = _heapSize;
	for (int i = _heapSize-1; i > 0; i--) {
		[self swapElementsAtIndex:0 andIndex:i];
		_heapSize--;
		[self heapify];
	}
	_heapSize = actualHeapSize;
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
	NSMutableString *desc = [NSMutableString new];
	[desc appendFormat:@"%@", heapArray[0]];
	for (int i = 1; i < _heapSize; i++) {
		[desc appendFormat:@", %@", heapArray[i]];
	}
	return desc;
}

@end
