#import <Foundation/NSArray.h>

extern int const DEFAULT_HEAP_SIZE;

@interface Heap : NSObject {
	id *heapArray;
}

@property (readonly) int heapSize;

- (id)init;
- (id)initWithHeapSize:(int)size;
- (id)initWithArray:(NSArray *)array;
- (int)parent:(int)index;
- (int)left:(int)index;
- (int)right:(int)index;
- (void)heapify;
- (void)heapifyAtIndex:(int)idx;
- (int)heapifyOnceAtIndex:(int)index;
- (void)growArray:(int)newSize;
- (void)dealloc;
- (NSString *)description;

@end
