#import <math.h>
#import "MergeSort.h"

@implementation MergeSort
+ (NSMutableArray *)sortArray:(NSMutableArray *)input {
	return [MergeSort merge_sort:input fromIndex:0 toIndex:[input count] - 1];
}

+ (NSMutableArray *)merge_sort:(NSMutableArray *)array fromIndex:(int)first toIndex:(int)last {
	if (first < last) {
		int midpoint = (int)floor((first + last)/2);
		array = [MergeSort merge_sort:array fromIndex:first toIndex:midpoint];
		array = [MergeSort merge_sort:array fromIndex:midpoint + 1 toIndex:last];
		array = [MergeSort merge:array left:first middle:midpoint right:last];
	}
	return array;
}

+ (NSMutableArray *)merge:(NSMutableArray *)array left:(int)left middle:(int)middle right:(int)right {
	NSMutableArray *mergedArray = [NSMutableArray arrayWithArray:array];
  
	int leftIndex = left;
	int rightIndex = middle + 1;
	for (int mergedIndex = left; mergedIndex <= right; mergedIndex++) {
		if (leftIndex <= middle
				&& (rightIndex > right || [[array objectAtIndex:leftIndex] compare:[array objectAtIndex:rightIndex]] != NSOrderedDescending)) {
			[mergedArray replaceObjectAtIndex:mergedIndex withObject:[array objectAtIndex:leftIndex]];
			leftIndex++;
		} else {
			[mergedArray replaceObjectAtIndex:mergedIndex withObject:[array objectAtIndex:rightIndex]];
			rightIndex++;
		}
	}
	return mergedArray;
}
@end
