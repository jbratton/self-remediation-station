#import <Foundation/Foundation.h>
#import "Heap.h"

@implementation Heap

- (id)initWithArray:(NSArray *)array {
	heapSize = [array count];

	heapArray = (id *)malloc(sizeof(id) * heapsize);

	if (heapArray == NULL) {
		NSLog(@"wtf, man -- couldn't malloc for a new Heap");
		exit(-1);
	}

	for (int i = 0; i < heapSize; i++) {
		heapArray[i] = [array objectAtIndex:i];
	}

	for (int i = heapSize/2 - 1; i >= 0; i--) {
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

- (int)heapifyAtIndex:(int)idx {
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
	if (left <= heapSize && [heapArray[left] compare:heapArray[index]] == NSOrderedDescending)
		largest = left;
	else
		largest = index;

	if (right <= heapSize && [heapArray[right] compare:heapArray[largest]] == NSOrderedDescending)
		largest = right;

	if (largest != index) {
		id temp = heapArray[index];
		heapArray[index] = heapArray[largest];
		heapArray[largest] = temp;
	}

	return largest;
}

- (void)growArray:(int)newSize {
	id newHeapArray[] = (id *)malloc(sizeof(id) * newSize);
	if (newHeapArray == NULL) {
		NSLog(@"ran out of memory to grow heapArray");
		exit(-1);
	}
	for (int i = 0; i < heapSize; i++) {
		newHeapArray[i] = heapArray[i];
	}
	free(heapArray);
	heapArray = newHeapArray;
}

- (void)dealloc {
	if (heapArray) free(heapArray);
	heapArray = NULL;
}

@end
