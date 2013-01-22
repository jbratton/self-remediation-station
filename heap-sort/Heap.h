#import <Foundation/NSArray.h>

@interface Heap : NSObject {
	id heapArray[];
}

@property (readonly) int heapSize;

- (id)initWithArray:(NSArray *)array;
- (int)parent:(int)index;
- (int)left:(int)index;
- (int)right:(int)index;
- (void)heapify;
- (int)heapifyAtIndex:(int)idx;
- (int)heapifyOnceAtIndex:(int)index;
- (void)growArray:(int)newSize;

@end
