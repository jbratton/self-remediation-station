#import "MergeSort.h"

int main () {
  NSMutableArray *input = [NSMutableArray arrayWithArray:@[@54, @43, @1, @5, @6, @1, @7, @7]];
  NSMutableArray *result = [MergeSort sortArray:input];
  return 0;
}
