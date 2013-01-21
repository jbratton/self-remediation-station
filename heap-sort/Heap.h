#import <Foundation/NSArray.h>

@interface Heap : NSObject {
	id heapArray[];
}

@property (readonly) int heapSize;

- (int)parent:(int)index;
- (int)left:(int)index;
- (int)right:(int)index;
- (void)heapify;
- (int)heapifyAtIndex:(int)index;
- (void)growArray:(int)newSize;

+ (Heap *)initWithArray:(NSArray *)array;

@end
