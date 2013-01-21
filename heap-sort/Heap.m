#import <Foundation/Foundation.h>
#import "Heap.h"

@implementation Heap
- (int)parent:(int)index { return index/2; }
- (int)left:(int)index { return index*2; }
- (int)right:(int)index { return index*2+1; }

- (void)heapify {
	int lastIndex = 0;
	int index = 0;
	
	do {
		lastIndex = index;
		index = [self heapifyAtIndex:index];
	} while (index != lastIndex);
}

- (int)heapifyAtIndex:(int)index {
	return index;
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

+ (Heap *)initWithArray:(NSArray *)array {
	heapSize = [array count];

	heapArray = (id *)malloc(sizeof(id) * heapsize);
	if (heapArray == NULL) {
		NSLog(@"wtf, man -- couldn't malloc for a new Heap");
		exit(-1);
	}

	for (int i = 0; i < heapSize; i++) {
		heapArray[i] = (id)[array objectAtIndex:i];
	}
}

@end
