#import <Foundation/NSArray.h>

extern int const DEFAULT_HEAP_ARRAY_SIZE;
extern NSComparisonResult const DEFAULT_ORDERING;

@interface Heap : NSObject {
	id *heapArray;
	int heapArraySize;
	NSComparisonResult heapOrdering;
}

@property (readonly) int heapSize;

- (id)init;
- (id)initWithArray:(NSArray *)array;
- (id)initWithHeapArraySize:(int)size;
- (NSComparisonResult)swapHeapOrdering;

- (int)parent:(int)index;
- (int)left:(int)index;
- (int)right:(int)index;

- (void)heapify;
- (void)heapifyAtIndex:(int)idx;
- (int)heapifyOnceAtIndex:(int)index;
- (void)swapElementsAtIndex:(int)idx_a andIndex:(int)idx_b;

- (void)buildHeap;
- (void)sortHeap;

- (void)insert:(id)object;
- (id)maximum;
- (id)extractMaximum;
- (id)removeRoot;
- (id)minimum;
- (id)extractMinimum;

- (void)growArray:(int)newSize;

- (void)dealloc;

- (NSString *)description;

@end
