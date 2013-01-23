#import <Foundation/Foundation.h>
#import "Heap.h"

int const DEFAULT_HEAP_ARRAY_SIZE = 16;
NSComparisonResult const DEFAULT_ORDERING = NSOrderedAscending;

@implementation Heap

- (id)init {
	return [self initWithHeapArraySize:DEFAULT_HEAP_ARRAY_SIZE];
}

- (id)initWithArray:(NSArray *)array {
	[self initWithHeapArraySize:[array count]];
	_heapSize = [array count];

	for (int i = 0; i < _heapSize; i++) {
		heapArray[i] = [array objectAtIndex:i];
	}
	[self buildHeap];

	return self;
}

- (id)initWithHeapArraySize:(int)size {
	_heapSize = 0;
	heapArraySize = size;
	heapArray = (id *)malloc(sizeof(id) * heapArraySize);
	heapOrdering = DEFAULT_ORDERING;

	if (heapArray == NULL) {
		NSLog(@"wtf, man -- couldn't malloc for a new Heap");
		exit(-1);
	}
	return self;
}

- (NSComparisonResult)swapHeapOrdering {
	heapOrdering = -heapOrdering;
	return heapOrdering;
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
	int extreme;
	int left = [self left:index];
	int right = [self right:index];
	if (left < _heapSize && [heapArray[left] compare:heapArray[index]] != heapOrdering)
		extreme = left;
	else
		extreme = index;

	if (right < _heapSize && [heapArray[right] compare:heapArray[extreme]] != heapOrdering)
		extreme = right;

	if (extreme != index) {
		[self swapElementsAtIndex:index andIndex:extreme];
	}

	return extreme;
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

- (void)insert:(id)object {
	if (_heapSize == heapArraySize) {
		[self growArray:heapArraySize*2];
	}
	_heapSize++;
	int index = _heapSize - 1;
	while (index > 0 && [heapArray[[self parent:index]] compare:object] == DEFAULT_ORDERING) {
		[self swapElementsAtIndex:index andIndex:[self parent:index]];
		index = [self parent:index];
	}
	heapArray[index] = object;
}

- (id)maximum {
	if (_heapSize < 1) return nil;
	if (heapOrdering != NSOrderedAscending) {
		[self swapHeapOrdering];
		[self buildHeap];
	}
	return heapArray[0];
}

- (id)extractMaximum {
	if (_heapSize < 1) return nil;
	id max = [self maximum];
	[self removeRoot];
	return max;
}

- (id)removeRoot {
	id root = heapArray[0];
	[self swapElementsAtIndex:0 andIndex:_heapSize-1];
	_heapSize--;
	[self heapify];
	return root;
}

- (id)minimum {
	if (_heapSize < 1) return nil;
	if (heapOrdering != NSOrderedDescending) {
		[self swapHeapOrdering];
		[self buildHeap];
	}
	return heapArray[0];
}

- (id)extractMinimum {
	if (_heapSize < 1) return nil;
	id min = [self minimum];
	[self removeRoot];
	return min;
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
	heapArraySize = newSize;
}

- (void)dealloc {
	if (heapArray) free(heapArray);
	heapArray = NULL;
}

- (NSString *)description {
	NSMutableString *desc = [NSMutableString new];
	if (_heapSize < 1) return desc;
	[desc appendFormat:@"%@", heapArray[0]];
	for (int i = 1; i < _heapSize; i++) {
		[desc appendFormat:@", %@", heapArray[i]];
	}
	return desc;
}

@end
