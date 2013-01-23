#import <Foundation/Foundation.h>
#import <stdlib.h>
#import "Heap.h"

int main(void) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NSArray *inputArrays = @[
		@[@6, @4, @2, @0, @6, @7, @8],
		@[@1, @2, @3, @4, @5, @6, @7],
		@[@7, @6, @5, @4, @3, @2, @1],
		@[@32, @3, @36, @75, @74, @-1, @36, @-1, @6, @9, @60, @63, @65, @87, @3]
	];

	for (id array in inputArrays) {
		NSLog(@"---- array is like: %@", [array componentsJoinedByString:@", "]);
		Heap *h = [[Heap alloc] initWithArray:array];
		NSLog(@"heap is like: %@", h);
		[h sortHeap];
		NSLog(@"sorted heap: %@", h);
		[h buildHeap];
		NSLog(@"back to heap: %@", h);
		[h swapHeapOrdering];
		[h buildHeap];
		NSLog(@"swapped ordering: %@", h);
		[h sortHeap];
		NSLog(@"sorted: %@", h);
		[h swapHeapOrdering];
		[h buildHeap];
		NSLog(@"swapped back: %@", h);
		NSLog(@"maximum is: %@", [h extractMaximum]);
		NSLog(@"what's left: %@\n", h);
	}

	int testHeapSize = 20;
	Heap *h = [[Heap alloc] init];
	for (int i = 0; i < testHeapSize; i++) {
		NSNumber *rnd = [NSNumber numberWithInt:arc4random_uniform(742)];
		[h insert:rnd];
	}
	NSLog(@"testHeap: %@", h);
	[h sortHeap];
	NSLog(@"sorted: %@", h);
	[h swapHeapOrdering];
	[h buildHeap];
	NSLog(@"order swapped heap: %@", h);
	[h sortHeap];
	NSLog(@"sorted: %@", h);
	[h buildHeap];
	id node;
	while ((node = [h extractMaximum])) {
		NSLog(@"max: %@, heap: %@", node, h);
	}

	[pool drain];
	return 0;
}
