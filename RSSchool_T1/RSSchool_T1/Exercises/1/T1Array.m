#import "T1Array.h"

@interface T1Array ()

@property (assign, nonatomic) BOOL isArrayHappy;

@end

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray == nil || [sadArray count] == 0) {
        
        NSLog(@"Sad array is empty! Sad array returned");
        return sadArray;
     
    } else if ([sadArray count]  == 1) {
        
        NSLog(@"Elements count of Sad array equals 1! Sad array returned");
        return sadArray;
        
    } else {
        
        NSArray *happyArray = [self sendArrayToClean:sadArray];
        
        while (self.isArrayHappy != YES) {
            happyArray = [self sendArrayToClean:happyArray];
        }
        return happyArray;
    }
}


- (NSArray *)sendArrayToClean:(NSArray *)sadArray {
    
    NSMutableArray *resultArray = [NSMutableArray arrayWithArray:sadArray];
    NSUInteger indexOfElementToDelete = 0;
    int sumOfPreviousAndNextElement = 0;
    
    for (NSNumber *currentNumber in resultArray) {
        
        int previousElement;
        int currentElement = [currentNumber intValue];
        int nextElement;
        
        if ([currentNumber isEqual:[resultArray firstObject]]) {
            continue;
        } else if ([currentNumber isEqual:[resultArray lastObject]]) {
           continue;
        } else {
            previousElement = [[resultArray objectAtIndex:[resultArray indexOfObject:currentNumber] - 1] intValue];
            nextElement = [[resultArray objectAtIndex:[resultArray indexOfObject:currentNumber] + 1] intValue];
            sumOfPreviousAndNextElement = previousElement + nextElement;
        }
        
        if (sumOfPreviousAndNextElement < currentElement) {
            indexOfElementToDelete = [resultArray indexOfObject:currentNumber];
            break;
        }
    }
    
    if (indexOfElementToDelete == 0) {
        self.isArrayHappy = YES;
    } else {
        self.isArrayHappy = NO;
        [resultArray removeObjectAtIndex:indexOfElementToDelete];
    }
    
    return [NSArray arrayWithArray:resultArray];
}

@end
