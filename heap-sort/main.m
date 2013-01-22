#import <Foundation/Foundation.h>
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
		NSLog(@"array is like: %@", [array componentsJoinedByString:@", "]);
		Heap *h = [[Heap alloc] initWithArray:array];
		NSLog(@"heap is like:\n%@", h);
	}

	[pool drain];
	return 0;
}
