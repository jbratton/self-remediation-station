#import <Foundation/NSArray.h>

@interface MergeSort : NSObject
+ (NSMutableArray *)sortArray:(NSMutableArray *)input;
+ (NSMutableArray *)merge_sort:(NSMutableArray *)array fromIndex:(int)first toIndex:(int)last;
+ (NSMutableArray *)merge:(NSMutableArray *)array left:(int)left middle:(int)middle right:(int)right;
@end
