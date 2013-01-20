#import <Foundation/Foundation.h>
#import "MergeSort.h"

int main (int argc, const char * argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NSArray *inputArrays = @[
		[NSMutableArray arrayWithObjects:@54, @43, @1, @5, @6, @1, @7, @7, nil],
		[NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, nil],
		[NSMutableArray arrayWithObjects:@10, @9, @8, @7, @6, @5, @4, @3, @2, @1, nil],
		[NSMutableArray arrayWithObjects:@100, @34, @43, @665, @32, @32, @43, @34, @1, @-100, @-72, @42, @-100, @43, @17, @2, @3, @4, nil]
	];

	for (id input in inputArrays) {
		NSMutableArray *result = [MergeSort sortArray:input];
	
		NSLog(@"input array: %@", [input componentsJoinedByString:@", "]);
		NSLog(@"result array: %@", [result componentsJoinedByString:@", "]);
	}

	[pool drain];
	return 0;
}
