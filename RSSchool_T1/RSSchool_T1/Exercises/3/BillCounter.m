#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    int ourBillWithoutNotIncludingElement = 0;
    
    for (int i = 0; i < [bill count]; i++) {
        
        if (i == index) {
            continue;
        } else {
            ourBillWithoutNotIncludingElement += [[bill objectAtIndex:i] intValue];
        }
    }
    
    int sharedBill =ourBillWithoutNotIncludingElement / 2;
    
    if ([sum intValue] > sharedBill) {
        return [NSString stringWithFormat:@"%d", [sum intValue] - sharedBill];
    } else {
        return @"Bon Appetit";
    }
}

@end
